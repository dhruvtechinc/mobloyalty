class BusinessesController < ApplicationController
	def index
	end
	def new
		@business = Business.new
	end
	def show
	end
	def create
		if params[:refer]
			@business = Business.new(business_params)
			flash[:business_errors] = nil
			flash[:business_info] = nil
			if @business.save
			flash[:business_info] = 'Got it, Thanks! We will be contacting you shortly!'
			@business = Business.new
			else
				flash[:business_errors] = @business.errors.full_messages.clone
			end	
			# redirect_to root_url(anchor: 'business') - this was used to in Single Page approach to redirect to root url
			
			render 'new'
		end

	end

private

def business_params
		params[:business][:phone_number] = params[:business][:phone_number].delete("^0-9")
		params.require(:business).permit(:name, :address, :city, :state, :zip, :phone_number)
end

end
