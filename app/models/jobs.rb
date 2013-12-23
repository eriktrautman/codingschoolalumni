class Jobs < ActiveRecord::Base
	attr_accesible :company_name
	
	belongs_to :user
end
