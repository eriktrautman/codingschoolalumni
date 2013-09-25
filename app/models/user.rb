class User < ActiveRecord::Base

  belongs_to :cohort
  has_one :school, :through => :cohort

end
