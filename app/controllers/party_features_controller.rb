class PartyFeaturesController < ApplicationController
  before_action :authenticate_user

  def show
    @party_feature = PartyFeature.find params[:id]
    render json: @party_feature, status: :ok
  end

  def update
    PartyFeature.transaction do
      @party_place = PartyPlace.find params[:id]
      @party_features = @party_place.party_feature

      @party_features.smoke_place = registration_params[:smoke_place]
      @party_features.available_tables = registration_params[:available_tables]
      @party_features.completed = true
      set_party_feature_tags

      @party_features.save!

      render json: @party_features, status: :ok
    end
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  private
  def handle_tag_lists(tag_list, list_to_update)
    if tag_list.length > 0
      tags_to_remove = []

      tag_list.each do |tag|
        tags_to_remove << tag
      end

      tag_list.remove(tags_to_remove.join(', '), parse: true)
    end

    tag_list.add list_to_update
  end

  def set_party_feature_tags
    handle_tag_lists(@party_features.drink_type_list, registration_params[:drink_type_list])
    handle_tag_lists(@party_features.food_type_list, registration_params[:food_type_list])
    handle_tag_lists(@party_features.party_type_list, registration_params[:party_type_list])
    handle_tag_lists(@party_features.music_style_list, registration_params[:music_style_list])
  end

  def registration_params
    params.require(:party_features).permit(
      :smoke_place,
      :available_tables,
      food_type_list: [],
      party_type_list: [],
      drink_type_list: [],
      music_style_list: []
    )
  end
end
