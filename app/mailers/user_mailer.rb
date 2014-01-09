class UserMailer < ActionMailer::Base
  default from: "erik@theodinproject.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: "erik@theodinproject.com", :subject => "CSAA Signup Confirmation", bcc: "erik@theodinproject.com")
  end

  def pw_reset_email(user)
    @user = user
    mail(to: @user.email, from: "erik@thedinoproject.com", :subject => "CSAA Password Recovery", bcc: "erik@theodinproject.com")
  end

end
