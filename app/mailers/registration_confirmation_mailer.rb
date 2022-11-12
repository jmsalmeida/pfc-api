class RegistrationConfirmationMailer < ApplicationMailer
  def registration_confirmation
    @user = params[:user]

    mail(to: "<#{@user.email}>", subject: "Registration confirmation")
  end
end
