class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone, :name


   has_many :haves, :class_name => "Have"
   has_many :wants
   
   def check_matches
   	wants = self.wants
   	haves = self.haves
   	User.all.each do |user|
		matched_wants = wants.collect{|want|want.name unless want.processed }&user.haves.collect{|have|have.name unless have.processed}
		matched_haves = haves.collect{|have|have.name unless have.processed}&user.wants.collect{|want|want.name unless want.processed}
   	
   		if matched_wants.length > 0 && matched_haves.length > 0
   			want = matched_wants[0]
   			have = matched_haves[0]
   			new = Want.find_by_name_and_user_id(want, self.id)
   			new.processed = true
   			new.save!
   			new = Have.find_by_name_and_user_id(have, self.id)
   			new.processed = true
   			new.save!
   			new = Want.find_by_name_and_user_id(have, user.id)
   			new.processed = true
   			new.save!
   			new = Have.find_by_name_and_user_id(want, user.id)
   			new.processed = true
   			new.save!
   			user.send_message("#{self.name} would like to trade #{have} for #{want}")
   			self.send_message("#{user.name} would like to trade #{want} for #{have}")
   			
   		end
   	end
   
   
   end
   
   def send_message(message)
   	  require 'rubygems'
      require 'twilio-ruby'
      puts "message sent"
      
      account_sid = "AC990f18e5157c416d9a2695f5b392eac9"
      auth_token = "90a3f5ef444416d12cad86f2191f0e95"
      
      @client = Twilio::REST::Client.new account_sid, auth_token
      
      @client.account.sms.messages.create(
      	:from => "+14155992671",
      	:to => self.phone,
      	:body => message
      )
   
   
   
   end
end
