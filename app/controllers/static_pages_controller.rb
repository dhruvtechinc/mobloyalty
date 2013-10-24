class StaticPagesController < ApplicationController
 def home
  	@user = User.new
  end

  def create
  	if [params[:merchant]] || [params[:customer]]
  		render "user/create"
  	elsif [params[:signin]]
  		render "sessions/create"
  	end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
