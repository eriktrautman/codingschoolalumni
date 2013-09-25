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

end
