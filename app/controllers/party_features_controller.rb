class PartyFeaturesController < ApplicationController
  before_action :authenticate_user

  def show
    @party_feature = PartyFeature.find params[:id]
    render json: @party_feature, status: :ok
  end

  def update
    PartyFeature.transaction do
      @party_feature = PartyFeature.find params[:id]

      unless @party_feature.blank?
        @party_feature.smoke_place = registration_params[:smoke_place]
        @party_feature.available_tables = registration_params[:available_tables]
        @party_feature.completed = true
        set_party_feature_tags

        @party_feature.save!
      end

      render json: @party_feature, status: :ok
    end
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  private
  def set_party_feature_tags
    @party_feature.food_type_list.add(registration_params[:food_type_list])
    @party_feature.drink_type_list.add(registration_params[:drink_type_list])
    @party_feature.party_type_list.add(registration_params[:party_type_list])
    @party_feature.music_style_list.add(registration_params[:music_style_list])
  end

  def registration_params
    params.require(:party_feature).permit(
      :smoke_place,
      :available_tables,
      food_type_list: [],
      party_type_list: [],
      drink_type_list: [],
      music_style_list: []
    )
  end
end
