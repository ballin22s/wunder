class UserMailer < ApplicationMailer

  #Send Account Activiation Email
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  #Send Password Reset Email
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  
end