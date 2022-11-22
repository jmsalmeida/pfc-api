class Auth::AuthActionsController < ApplicationController
  include CreateSession

  def resend_email
    @user = User.find params[:user_id]

    if @user.id
      @user.generate_confirmation_token
      @user.save!
      RegistrationConfirmationMailer.with(user: @user).registration_confirmation.deliver_later
    end
  end

  def confirm_email
    @user = User.find_by_confirm_token params[:confirm_token]

    if @user
      @user.email_activate

      if @user.user_type == 'party_place'
        @party_place = PartyPlace.find_by user_id: @user.id
      else
        @partyer = Partyer.find_by user_id: @user.id
      end

      @token = "Bearer #{jwt_session_create @user.id}"

      response.headers['Authorization'] = @token
      render status: :created, template: "auth/auth"
    else
      render json: { errors: [I18n.t('errors.controllers.auth.invalid_confirmation_token')] }, status: :unauthorized
    end
  end
end
