class PartyersController < ApplicationController
  def index
    @partyers = Partyer.all
    render json: @partyers, status: :ok
  end

  def create
    # TODO: Use params.require(:model).permit(:attr) => Discovery how to work with relationship

    User.transaction do
      user = User.create email: params[:email].downcase, password: params[:password], user_type: params[:user_type]
      @partyer = Partyer.create name: params[:name], gender: params[:gender], birth_date: params[:birth_date], user: user

      user.save!
      @partyer.save!

      render json: @partyer, status: :created
    end
  end
end
