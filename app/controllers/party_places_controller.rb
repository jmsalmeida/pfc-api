class PartyPlacesController < ApplicationController
  prepend_before_action :authenticate_with_api_key!, only: %i[index show]

  def index
    party_places = nil

    if params.has_key?(:party_place_name)
      name = params[:party_place_name]
      party_places = PartyPlace.where(name: name)

      if party_places.empty?
        render json: { errors: 'Estabelecimento não encontrado' }, status: :not_found
      else
        render json: party_places, status: :ok
      end
    else
      party_places = PartyPlace.all
      render json: party_places, status: :ok
    end
  end

  def create
    User.transaction do
      user = User.create email: params[:email], password: params[:password]
      user.user_type = 'party_place'
      user.save!

      party_place = PartyPlace.create name: params[:name], cnpj: params[:cnpj], phone: params[:phone], cellphone: params[:cellphone], main_contact: params[:main_contact]
      party_place.user = user
      party_place.save!

      address = Address.create street: params[:street], city: params[:city], place_number: [:place_number], postal_code: params[:postal_code], district: params[:district]
      address.party_place = party_place
      address.save!

      render json: party_place, status: :created
    end
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def show
    party_place = PartyPlace.find(params[:id])
    render json: party_place, status: :ok
  end
end
