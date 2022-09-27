class Checkin::VisitPartiesController < ApplicationController
  before_action :authenticate_user

  def create
    @checkin = Checkin.new
    @party_place = PartyPlace.find params[:party_place_id]
    @partyer = Partyer.find_by(user_id: @current_user.id)

    @checkin.partyer = @partyer
    @checkin.party_place = @party_place
    @checkin.save!

    render json: @checkin, status: :ok
  end

  private
  def visit_party_params
    params.require(:visit_party).permit(:party_place_id)
  end
end
