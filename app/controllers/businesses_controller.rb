class BusinessesController < ApplicationController
	def index
	end
	def new
	end
	def show
	end
	def create
		if params[:refer]
			@business = Business.new(business_params)
			if @business.save
			flash[:business_info] = 'Got it, Thanks!'
			else
				flash[:business_errors] = @business.errors.full_messages.clone
			end	
			redirect_to root_url(anchor: 'business')
		end

	end

private

def business_params
		params.require(:business).permit(:name, :address, :city, :state, :zip, :phone_number)
end

end
