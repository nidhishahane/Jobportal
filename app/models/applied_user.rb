class AppliedUser < ActiveRecord::Base

	belongs_to :users
	belongs_to :vacancies
	
end
