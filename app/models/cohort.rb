class Cohort < ActiveRecord::Base

  validates_presence_of :school_id, :start_date, :end_date, :city_id

  has_one :school
  has_many :alumni, :through => :school, :source => :user_id
  has_many :cities

end
