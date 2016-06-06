class Company < ActiveRecord::Base
   resourcify
	has_many :vacancies

	def self.search(search)
	 # where("city LIKE ?","%#{search}%")
	  where("city ILIKE ?","%#{search}%")
 	end

end
