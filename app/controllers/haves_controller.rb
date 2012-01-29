class HavesController < ApplicationController
   before_filter :authenticate_user!
  respond_to :html, :js
 
 def create
 	@user = current_user
 	@have = @user.haves.create(params[:have])
 	@user.check_matches
 	respond_with @have, :location => root_path
  end

  def destroy
  	@have = Have.find(params[:id])
  	@have.destroy
  	respond_with @have, :location => root_path
  end

end
