class PartyPlacesController < ApplicationController
  before_action :authenticate_user

  def index
    if params.has_key?(:party_place_name)
      @party_places = PartyPlace.where(name: params[:party_place_name])

      if @party_places.empty?
        render json: { errors: 'Estabelecimento não encontrado' }, status: :not_found
      else
        render status: :ok, template: "party_places"
      end
    else
      @party_places = paginate PartyPlace.all
      render status: :ok, template: "party_places"
    end
  end

  def show
    @party_places = PartyPlace.find(params[:id])
    render status: :ok, template: "party_places"
  end
end
