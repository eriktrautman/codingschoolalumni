class UsersController < ApplicationController

  def new
    @user = User.new
    @schools_list = School.all
    @cohorts_list = Cohort.all
  end

end
