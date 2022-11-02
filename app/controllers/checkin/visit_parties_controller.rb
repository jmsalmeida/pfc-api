class Checkin::VisitPartiesController < ApplicationController
  before_action :authenticate_user

  def create
    @partyer = Partyer.find_by(user_id: @current_user.id)
    @party_place = PartyPlace.find params[:party_place_id]
    @checkin = @party_place.checkins.create partyer_id: @partyer.id

    render json: @checkin, status: :created
  end
end
