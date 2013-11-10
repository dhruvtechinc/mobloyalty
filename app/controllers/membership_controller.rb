class MembershipController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, except: [:new]
  def new
  	@membership = Membership.new
  end

  def show
  	@storesearch = StoreSearch.new
    puts params[:id]
  	@membership = Membership.where(:user_id => params[:id]).paginate(page: params[:page])
  	if @membership.empty?
  		redirect_to "/store_searches/new"
  	end
  end

  def create
  end

end
