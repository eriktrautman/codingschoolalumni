class UserMailer < ActionMailer::Base
  default from: "erikcsaa@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: "erikcsaa@gmail.com", :subject => "CSAA Signup Confirmation", bcc: "erikcsaa@gmail.com")
  end

end
