class StaticPagesController < ApplicationController
  
 def home
  	@user = User.new
    @business = Business.new
  end

  def create
  	if [params[:register]] || [params[:customer]]
  		render "user/create"
    elsif [params[:signin]]
      render "sessions/create"
  	elsif [params[:refer]]
  		render "business/create"
  	end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
