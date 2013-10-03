class UsersController < ApplicationController

  def new
    @user = User.new
    @schools_list = School.all
    @cohorts_list = Cohort.includes(:city).map do |c|
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
    redirect_to "/auth/linkedin"
  end

  def create
    if session[:cohort_id]
      cohort = Cohort.find_by_id(session[:cohort_id])
      if cohort
        @user = User.new( 
            :email => auth_hash[:info][:email], 
            :fname => auth_hash[:info][:first_name],
            :lname => auth_hash[:info][:last_name],
            :cohort_id => cohort.id)
        if @user.save
          flash[:success] = "Success! You're all signed up... Now spread the word!"
          redirect_to root_path
        else
          flash[:error] = "We couldn't create your account due to the following errors: #{@user.errors.full_messages }!"
          redirect_to root_path
        end
      else
        flash[:error] = "Error! We got your LinkedIn credentials but the cohort that you selected wasn't valid.  Could be our fault..."
      end
    else
      flash[:error] = "Error! We got your LinkedIn credentials but couldn't find the cohort_id you selected originally.  Probably our fault."
      redirect_to root_path
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
