class City < ActiveRecord::Base

  validates_presence_of :name, :abbrev

  has_many :campuses  # rails can't pluralize this
  has_many :schools, :through => :campuses  # rails can't pluralize this


end
