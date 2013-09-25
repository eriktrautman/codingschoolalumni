class Campus < ActiveRecord::Base

  validates_presence_of :school_id, :city_id

  belongs_to :city
  belongs_to :school

end
