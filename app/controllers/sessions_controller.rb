class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if !!user
      user.reset_session_token!
      session[:token] = user.session_token
      redirect_to user_url(user)
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