class School < ActiveRecord::Base

  validates_presence_of :name

  has_many :cohorts
  has_many :alumni, :foreign_key => :user_id
  has_many :campuses # rails can't pluralize this
  has_many :cities, :through => :campuses # rails can't pluralize this

end
