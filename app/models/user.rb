class User < ActiveRecord::Base

  has_one :school
  has_one :cohort

end
