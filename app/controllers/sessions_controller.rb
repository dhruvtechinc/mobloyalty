class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			if user.customer_account?
				redirect_to :controller => 'membership', :action => 'show', :id => user.id #, :something => 'else' "/membership/show"
			elsif user.merchant_account?
				redirect_to :controller => 'rewards', :action => 'new', :id => user.id, :ar => 'Accrue' #, :something => 'else' "/membership/show"
			end
				
		else
			flash[:signin_error] = 'Invalid email/password combination'
			redirect_to root_url
		end		
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
