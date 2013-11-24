class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, except: [:create]
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user,   only: [:show, :edit, :update]
	#before_action :merchant_account, only: [:index]
	def index
		#@users = User.paginate(page: params[:page])		
		#@stores = Store.paginate(page: params[:page])
		redirect_to :controller => 'membership', :action => 'show', :id => current_user.id #, :something => 'else' "/membership/show"
	end
	def new
		puts params[:whois]
		@user = User.new
	end
	def show
		@user = User.find(params[:id])
	end
	def create
		if params[:register]
		@user = User.find_by(email: params[:user][:email].downcase)
		if @user
			flash[:user_info] = 'You have already signed-up. Thank you!'	
		else
			@user = User.new(user_params)
			if @user.save
			flash[:user_info] = 'We got you!'
			else
				flash[:user_errors] = @user.errors.full_messages.clone
			end	
		end
			redirect_to root_url(anchor: 'customer')
		end
	end

=begin
	def create
		Rails.logger.debug params.inspect
		if params[:merchant] || params[:customer]
			if params[:customer]
				params[:user][:merchant_account] = false
				params[:user][:customer_account] = true
			elsif params[:merchant]
				params[:user][:merchant_account] = true
				params[:user][:customer_account] = false
			end
			@user = User.new(user_params)
			if @user.save
	      	  # Handle a successful save.
		      sign_in @user
		      flash[:success] = "Welcome to MOB Loyalty!"
		      if params[:user][:merchant_account]
		      	redirect_to "/stores/new"
		      end
		      if params[:user][:customer_account]
		      	redirect_to @user
		      end
		  else
	  		  render 'new'
	  	  end
		elsif params[:signin]
			render "sessions/create"
		end
	end
=end

=begin
	def create
		Rails.logger.debug params.inspect
		params[:user][:merchant_account] = false
		params[:user][:customer_account] = true
		@user = User.new(user_params)
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts @user.inspect
		if @user.save
			puts "##################################################################3"
		      flash[:success] = "We got you!"
		else
			puts @user.inspect
			puts @user.errors.count
			#render root_url
	  	end
	  	puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	  	redirect_to root_url, alert: "Watch it, mister!"
	end
	=end


=begin
	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to users_url
  end
=end

private

def user_params
	params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :customer_account, :merchant_account, :password,
		:password_confirmation)
end

end
