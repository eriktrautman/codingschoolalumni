class Campus < ActiveRecord::Base

  validates_presence_of :school_id, :city_id

  has_many :cities
  has_many :schools
  
end
