class UsersController < ApplicationController

  def new
    @user = User.new
    @schools_list = School.all
  end

end
