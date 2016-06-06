class Vacancy < ActiveRecord::Base
	
  belongs_to :company

  has_many :users, through: :appliedusers

	def self.search(search)	 
	 # where("city LIKE ?","%#{search}%")
	  where("technology ILIKE ?","%#{search}%")
	end

	#def self.apply(@vacancy,userid)

	#	AppliedUser.insert("user_id=?,vacancy_id=?",@vacancy.id,userid)

	#end

end
