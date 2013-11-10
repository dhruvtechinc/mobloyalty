class StoreSearchesController < ApplicationController
  before_action :signed_in_user, :initialize_store

  def initialize_store
    @storesearch = StoreSearch.new
    @stores = Array.new
  end

  def new
  end

  def create
      @storesearch = StoreSearch.new(store_search_params)
      @stores = Array.new
      if @storesearch.valid?
        #members = current_user.memberships
        #storeids = Store.where(:id => members.map(&:store_id))
        #puts storeids.inspect
        #puts storeids[0].store.id
        @stores = Store.where(:zip => @storesearch.zip).where.not(:id => current_user.memberships.map(&:store_id))
        if @stores.empty?
          @storesearch.errors.add(:base, "No Results found, try again")
        end
      end
        render 'new'
  end

  def add
    #@storesearch = StoreSearch.new(store_search_params)
    userId = current_user.id #session[:user][:id]
    storeId = params[:store]
    @membership = Membership.new(user_id: userId, store_id: storeId)
    #@stores = Store.where(:zip => @storesearch.zip)
    if @membership.save
      flash[:notice] = "Save successful"
    else
      flash[:notice] = "Save NOT successful"
    end

    render 'new'
  end

  def show

  end

  def find
  end

  def store_search_params
    params.require(:store_search).permit(:name, :zip)
  end

end
