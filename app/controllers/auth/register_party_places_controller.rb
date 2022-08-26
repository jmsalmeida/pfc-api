class Auth::RegisterPartyPlacesController < Auth::RegistrationsController
  def create
    User.transaction do
      @user = self.create_user(registration_params[:user], 'party_place')
      @token = self.generate_token @user.id

      @party_place = PartyPlace.create registration_params[:party_place]
      @party_place.user = @user
      @party_place.save!

      @address = Address.create registration_params[:address]
      @address.party_place = @party_place
      @address.save!

      success_user_created
    end
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  protected

  def success_user_created
    response.headers['Authorization'] = @token
    render status: :created, template: "auth/auth"
  end

  private

  def registration_params
    params.require(:register_party_place).permit(
      user: [:email, :password],
      party_place: [:name, :cnpj, :phone, :cellphone, :main_contact],
      address: [:street, :city, :place_number, :postal_code, :district]
    )
  end
end