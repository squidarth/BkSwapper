class Want < ActiveRecord::Base
	attr_accessible :name, :author, :isbn, :user_id

	belongs_to :user
	
	
	
	def check_for_match
		@have = Have.find_by_name(self.name)
		@haver = @have.user
		@wanter = self.user
		if @have
			@wanter.send_message
			@haver.send_message
		end
	
	end
end
