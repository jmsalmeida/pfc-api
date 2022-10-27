class Auth::SessionsController < ApplicationController
  include CreateSession

  before_action :authenticate_user, only: [:destroy]
  
  def create
    return error_insufficient_params unless params[:email].present? && params[:password].present?
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        @token = jwt_session_create @user.id
        if @token
          @token = "Bearer #{@token}"

          if @user.user_type == 'party_place'
            @party_place = PartyPlace.find_by user_id: @user.id
          end

          return success_session_created
        else
          return error_token_create
        end
      else
        return error_invalid_credentials
      end
    else
      return error_invalid_credentials
    end
  end

  def destroy
    headers = request.headers['Authorization'].split(' ').last
    session = Session.find_by(token: JsonWebToken.decode(headers)[:token])
    session.close

    render status: :ok, json: {errors: [I18n.t('errors.controllers.auth.session_finished')]}
  end

  protected

  def success_session_created
    response.headers['Authorization'] = "Bearer #{@token}"
    render status: :created, template: "auth/auth"
  end

  def error_invalid_credentials
    render status: :unauthorized, json: {errors: [I18n.t('errors.controllers.auth.invalid_credentials')]}
  end

  def error_token_create
    render status: :unprocessable_entity, json: {errors: [I18n.t('errors.controllers.auth.token_not_created')]}
  end

  def error_insufficient_params
    render status: :unprocessable_entity, json: {errors: [I18n.t('errors.controllers.auth.insufficient_params')]}
  end
end
