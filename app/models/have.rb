class Have < ActiveRecord::Base
	attr_accessible :name, :author, :isbn, :user_id

	belongs_to :user
	
	def check_for_match
		@want = Want.find_by_name(self.name)
		@wanter = @want.user
		@haver = self.user
		if @want
			@wanter.send_message
			@haver.send_message
		end
	
	end
end
