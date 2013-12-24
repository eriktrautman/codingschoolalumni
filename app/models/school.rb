class School < ActiveRecord::Base
  #attr_accessible :id, :name

  validates_presence_of :name

  has_many :cohorts
  has_many :alumni, :through => :cohorts
  has_many :campuses 
  has_many :cities, :through => :campuses

end
