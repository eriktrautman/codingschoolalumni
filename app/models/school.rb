class School < ActiveRecord::Base

  has_many :cohorts
  has_many :alumni, :foreign_key => :user_id

end
