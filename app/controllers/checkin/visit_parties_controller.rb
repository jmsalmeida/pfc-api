class Checkin::VisitPartiesController < ApplicationController
  BR_TIME_ZONE = "Brasilia"

  before_action :authenticate_user

  def create
    @partyer = Partyer.find_by(user_id: @current_user.id)
    @party_place = PartyPlace.find params[:party_place_id]

    if @party_place.checkins.empty? || allowed_to_checkin?
      @checkin = @party_place.checkins.create partyer_id: @partyer.id
      render json: @checkin, status: :created
    else
      render json: { errors: [I18n.t('errors.controllers.checkin.last_visit_lt_min_hours')] }, status: 405
    end
  end

  private
  def allowed_to_checkin?
    current_user_checkins = @party_place.checkins.where(partyer_id: @partyer.id)
    return true if current_user_checkins.empty?

    last_checkin_time = current_user_checkins.last.created_at.in_time_zone BR_TIME_ZONE
    time_diff = (Time.current.in_time_zone(BR_TIME_ZONE) - last_checkin_time)
    diff_considering_minutes = (time_diff / 1.minute).round

    return diff_considering_minutes >= 180
  end
end
