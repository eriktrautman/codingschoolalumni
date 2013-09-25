class School < ActiveRecord::Base

  validates_presence_of :name

  has_many :cohorts
  has_many :alumni, :through => :cohorts
  has_many :campuses 
  has_many :cities, :through => :campuses

end
