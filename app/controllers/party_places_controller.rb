class PartyPlacesController < ApplicationController
  before_action :authenticate_user

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

  def show
    party_place = PartyPlace.find(params[:id])
    render json: party_place, status: :ok
  end
end
