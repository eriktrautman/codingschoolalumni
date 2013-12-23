class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_credentials(params[:email], params[:password])

    if !!user
      user.reset_session_token!
      session[:token] = user.session_token
      redirect_to users_url(user)
    else
      flash[:error] = "user does not exist"
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    redirect_to new_session_url
  end
end