class UserMailer < ActionMailer::Base
  default from: "erikcsaa@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: "erikcsaa@gmail.com", :subject => "Signup Confirmation")
  end

end
