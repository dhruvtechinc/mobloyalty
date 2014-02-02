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
		if params[:register] || params[:signup]
		@user = User.find_by(email: params[:user][:email].downcase)
		if @user
				@user = User.new
				if params[:register]
					flash[:user_info] = 'You are already a MobLoyalty member! Please sign in above.'	
					redirect_to root_url(anchor: 'customer')
				else
					flash[:user_info] = 'You are already a MobLoyalty member! Provide your email address or phone number as an identification'	
					render 'new'
				end
		else
			@user = User.new(user_params)
			if @user.save
				puts "Save successful"
				flash[:user_info] = 'You are Registered with Mob Loyalty! Welcome to our family'
				if params[:register]
					sign_in @user
					redirect_to :controller => 'membership', :action => 'show', :id => @user.id
				else
					@user = User.new
					render 'new'
				end
			else
				puts "User Error"
				flash[:user_errors] = @user.errors.full_messages.clone
				if params[:register]
					redirect_to root_url(anchor: 'customer')
				else
					render 'new'
				end

			end	
		end
		elsif params[:signin]
			render "sessions/create"
		end
		
	end


	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to users_url
  end


private

def user_params
	params[:user][:phone_number] = params[:user][:phone_number].delete("^0-9")
	store_id = nil
	if params[:signup]
		store_id = current_user.stores.first.id
	end
	params[:user][:initial_signup_store_id] = store_id
	params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :customer_account, :merchant_account, :password,
		:password_confirmation, :initial_signup_store_id)
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


