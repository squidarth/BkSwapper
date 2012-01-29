class HavesController < ApplicationController
   before_filter :authenticate_user!
  respond_to :html, :js
 
 def create
 	@user = current_user
 	@have = @user.haves.create(params[:have]) 
 	respond_with @have, :location => root_path
  end

  def destroy
  end

end
