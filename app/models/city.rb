class City < ActiveRecord::Base

  validates_presence_of :name, :abbrev

  has_many :campuses
  has_many :schools, :through => :campuses


end
