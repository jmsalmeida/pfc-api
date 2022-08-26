class Auth::RegisterPartyersController < Auth::RegistrationsController
  def create
    Partyer.transaction do
      @user = self.create_user(registration_params[:user], 'partyer')
      @token = self.generate_token @user.id

      @partyer = Partyer.create registration_params[:partyer]
      @partyer.user = @user
      @partyer.save!

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
    params.require(:register_partyer).permit(
      user: [:email, :password],
      partyer: [:name, :gender, :birth_date]
    )
  end
end
