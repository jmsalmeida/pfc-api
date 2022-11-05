class Auth::RegistrationsController < ApplicationController
  include CreateSession
  before_action :authenticate_user, only: :destroy

  after_action :send_email_confirmation, only: :create

  def destroy
    current_user.destroy
    render status: :no_content, json: { errors: [I18n.t('errors.controllers.auth.user_destroyed')]}
  end

  private

  def create_user(user_params, user_type)
    @user = User.create user_params
    @user.user_type = user_type
    @user.save!
    @user
  end

  def generate_token user_id
    token = jwt_session_create user_id

    if token
      return "Bearer #{token}"
    else
      error_token_create
    end
  end

  def send_email_confirmation
    if @user.id
      RegistrationConfirmationMailer.with(user: @user).registration_confirmation.deliver_later
    end
  end

  protected

  def error_token_create
    render status: :unprocessable_entity, json: { errors: [I18n.t('errors.controllers.auth.token_not_created')] }
  end
end
