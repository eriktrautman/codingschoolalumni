class Cohort < ActiveRecord::Base

  has_one :school
  has_many :alumni, :foreign_key => :user_id

end
