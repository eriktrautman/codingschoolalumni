class UsersController < ApplicationController
  require 'net/https'
  require 'open-uri'

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
  # it needs to persist the already-entered information and 
  # redirect the user to the LinkedIn signup flow
  def validate

    puts "\n\n\n\n\n I neeed to be validated!! \n\n\n\n\n\n"

  end

  def create
    # cohort = Cohort.find_by_id(params[:cohort_id])
    # hold off on creating the user for now... let's see if I can
    # track the cohort value through the linkedin signup process
      # render :signup_thank_you

    # to protect against CSRF.. right now I'm not saving it so it
    # is totally irrelevant
    state = "#{SecureRandom.urlsafe_base64(nil, false)}"

    redirect_uri = linkedin_signup_url(:cohort_id=>params[:cohort_id])
    # puts "\n\n\n\n #{redirect_uri} \n\n\n "
puts "\n\n\nREDIRECT URI IS #{redirect_uri}! \n\n\n"
    linkedin_url = "https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=3cnmfu8ljo81&scope=r_fullprofile%20r_emailaddress%20r_contactinfo&state=#{state}&redirect_uri=#{redirect_uri}"

    redirect_to linkedin_url
  end

  # This is called when the user successfully signs in to LinkedIn
  def validated_signup
    puts "\n\n\n\n\n I AM VALIDATED BABY WOOOO!!! \n\n\n\n\n\n"
  end

  def linkedin_signup
    # handle the redirect from linkedIn after authorization
    # see http://www.rubyinside.com/nethttp-cheat-sheet-2940.html

    if params[:error]
      puts "\n\n\n\n ERRORRRRRR at params #{params.inspect}! \n\n\n\n"
      redirect_to root_path
    else
      cohort_id = params[:cohort_id]
      authorization_code = params[:code]
      outgoing_params = {:cohort_id => cohort_id }
      redirect_uri = linkedin_signup_url(:cohort_id => cohort_id)

      linkedin_url = "https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{authorization_code}&redirect_uri=#{redirect_uri}&client_id=3cnmfu8ljo81&client_secret=ujXnuQv6SSc0oPSB"

      # Now turn the url into a post request to grab our token 
      url = URI.parse(linkedin_url)
      req = Net::HTTP::Post.new(url.request_uri)
      req.set_form_data(outgoing_params)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      response = http.request(req) # actually execute the request
      token = JSON.parse(response.body)["access_token"]

      # Now that we have the token, let's play around with the api
      # and grab the basic profile data to display in the log
      url = URI.parse("https://api.linkedin.com/v1/people/~?oauth2_access_token=#{token}&format=json")
      req = Net::HTTP::Get.new(url.request_uri)

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      response = http.request(req)
      puts "\n\n AFTER TESTING, RESPONSE BODY: #{response.body} !!! \n\n\n"
      redirect_to root_path
    end


  end


  private

  def signup_params
    params.require(:cohort).permit(:cohort, :id)
  end
end
