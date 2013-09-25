class Cohort < ActiveRecord::Base

  validates_presence_of :school_id, :start_date, :end_date, :city_id

  belongs_to :school
  has_many :alumni, :class_name => "User"
  belongs_to :city

end
