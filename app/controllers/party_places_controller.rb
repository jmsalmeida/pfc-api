class PartyPlacesController < ApplicationController
  before_action :authenticate_user

  def index
    filter_params = [:party_features, :party_place_name]

    if filter_params.any? {|key| params.has_key? key}
      feature_limit = []
      params[:party_features].split(',').each { |feature| feature_limit << feature }

      if feature_limit.length >= 6
        render json: { errors: [I18n.t('errors.controllers.party_places.not_found')] }, status: :not_found
        return
      end

      filter_by_party_features
      search_party_place_by_name

      unless @party_places.empty?
        render status: :ok, template: "party_places"
      else
        render json: { errors: [I18n.t('errors.controllers.party_places.not_found')] }, status: :not_found
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

  private

  def filter_by_party_features
    if params.has_key?(:party_features)
      @party_place_ids = PartyFeature.tagged_with(params[:party_features]).pluck(:party_place_id)
      @party_places = PartyPlace.find(@party_place_ids)
    end
  end

  def search_party_place_by_name
    if params.has_key?(:party_place_name)
      @search = params[:party_place_name]

      if @party_places.blank?
        @party_places = PartyPlace.where("name LIKE ?", "%#{@search}%")
      else
        @party_places = PartyPlace.where(id: @party_place_ids).where("name LIKE ?", "%#{@search}%")
      end
    end
  end
  end
