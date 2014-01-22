require 'bcrypt'


class UsersController < ApplicationController

  def new
    @user = User.new
    @schools_list = School.all
    cohort_show_cutoff = Date.today + 6.weeks
    @thanks = params[:thanks]
    @cohorts_list = Cohort.includes(:city)
        .where("cohorts.end_date < ?", cohort_show_cutoff)
        .order(:city_id => :asc, :end_date => :asc)
        .map do |c|
        {
          :id => c.id, 
          :city => c.city.abbrev,
          :end_date => c.end_date,
          :start_date => c.start_date,
          :school_id => c.school_id
        }
    end
  end

  # This is called when the user submits the splash page form
  # it persists the already-entered information and 
  # redirects the user to the LinkedIn signup flow
  def validate_signup
    session[:cohort_id] = params[:cohort_id]
    session[:digested_password] = BCrypt::Password.create(params[:user][:password])
    if params[:is_alt_form] == "true"
      session[:user_fname] = params[:user][:fname]
      session[:user_lname] = params[:user][:lname]
      session[:user_email] = params[:user][:email]
      redirect_to create_user_path
    else
      session[:user_fname] = nil
      session[:user_lname] = nil
      session[:user_email] = nil
      redirect_to "/auth/linkedin"
    end
  end

  def create
    if session[:cohort_id]
      cohort = Cohort.find_by_id(session[:cohort_id])
      if cohort
        if params[:linkedin]
          @user = User.new( 
              :email => auth_hash[:info][:email], 
              :fname => auth_hash[:info][:first_name],
              :lname => auth_hash[:info][:last_name],
              :linkedin_token => auth_hash[:credentials][:token],
              :cohort_id => cohort.id,
              )
        else
          @user = User.new(
              :email => session[:user_email], 
              :fname => session[:user_fname],
              :lname => session[:user_lname],
              :cohort_id => cohort.id,
              :password => session[:digested_password]
              )
        end
        if @user.save
          redirect_to root_path(:thanks => true)
        else
          flash[:error] = "We couldn't create your account due to the following errors: #{@user.errors.full_messages }!"
          redirect_to root_path
        end
      else
        flash[:error] = "Error! The cohort that you selected wasn't valid.  Could be our fault..."
        redirect_to root_path
      end
    else
      flash[:error] = "Error! We got your LinkedIn credentials but couldn't find the cohort_id you selected originally.  Probably our fault."
      redirect_to root_path
    end
  end

  def show
    if !!current_user && (params[:id].to_i == current_user.id)
      @user = current_user
      render :show
    else
      redirect_to root_url
    end
  end

  def request_pw_reset
    render :pw_reset_request
  end

  def send_pw_reset_email
    user = User.find_by_email(params[:user][:email])

    if !user
      flash[:error] = "User does not exist"
      redirect_to request_pw_reset_url
    else
      UserMailer.pw_reset_email(user).deliver!
      redirect_to root_url
    end
  end

  def edit_pw
    @user = User.find_by_id(params[:id])
    render :edit_pw
  end

  def update_pw
    @user = User.find_by_session_token(params[:validation_token])

    if !!@user
      @user.password = BCrypt::Password.create(params[:user][:password])
      if @user.save
        @user.reset_session_token!
        redirect_to user_url(@user)
      else
        flash[:error] = "Password reset unsuccessful"
        redirect_to "/user/#{@user.id}/pw_reset"
      end
    else
      flash[:error] = "invalid password reset key"
      redirect_to root_url
    end
  end


  private

  def signup_params
    params.require(:cohort).permit(:cohort, :id)
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

end
