class Want < ActiveRecord::Base
	attr_accessible :name, :author, :isbn, :user_id

	belongs_to :user
	
	
	

end
