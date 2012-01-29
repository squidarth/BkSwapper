class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		@user = current_user
  	else
  	
  		render :splash, :layout => false
  	end
  	
  end

  def about
  end

  def contact
  end

  def splash
  end

end
