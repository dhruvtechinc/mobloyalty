class StoresController < ApplicationController
	before_action :signed_in_user
	def new
		@store = Store.new
	end
	def index
	end

	def create
		@store = current_user.stores.build(stores_params)
		if @store.save
			redirect_to @store
		else
			render 'new'
		end
	end
	def destroy
	end

	def signup
	end
	
	def show
	end

	def stores_params
		params[:store][:store_number] = Store.maximum(:store_number).to_i + 1
		params[:store][:store_phone_number] = params[:store][:store_phone_number].delete("^0-9")
		params.require(:store).permit(:name, :address, :city, :state, :zip, :store_phone_number, :store_number)
	end
end
