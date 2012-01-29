class WantsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def create
  	@user = current_user
  	@want = @user.wants.create(params[:want])
  	
  	@user.check_matches
  	
  	respond_with @want, :location => root_path
  
  end

  def destroy
  end

end
