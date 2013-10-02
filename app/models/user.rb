class User < ActiveRecord::Base

  belongs_to :cohort
  has_one :school, :through => :cohort

  validates :email, :presence => true, :uniqueness => true
  [:cohort_id, :fname, :lname].each do |col|
    validates col, :presence => true
  end

end
