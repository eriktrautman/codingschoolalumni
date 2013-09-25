class UsersController < ApplicationController

  def new
    @user = User.new
    @schools_list = School.all
    @cohorts_list = Cohort.all # add an eager load of cities here
  end

end
