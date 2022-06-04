class PartyersController < ApplicationController
  prepend_before_action :authenticate_with_api_key!, only: %i[index]

  def index
    @partyers = Partyer.all
    render json: @partyers, status: :ok
  end

  def create
    # TODO: Use params.require(:model).permit(:attr) => Discovery how to work with relationship
    User.transaction do
      user = User.create email: params[:email], password: params[:password]
      user.user_type = 'partyer'
      user.save!

      partyer = Partyer.create name: params[:name], gender: params[:gender], birth_date: params[:birth_date], user: user
      partyer.save!

      render json: partyer, status: :created
    end
  end
end
