class RewardsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, except: [:create]
  def new
  	@reward = Reward.new
  end

  def create
  		user = 
  		@reward = Reward.new
  		store  = current_user.stores.first
  		if params[:accrue] || params[:redeem]
  			if !params[:reward][:email].empty?
  				puts "helllllo"
  				user = User.where(:email => params[:reward][:email]).first
  			end
  			if !params[:reward][:phone_number].empty?
  				puts "BAAAAAAAAAAAAAAAAAAAAAAAAa"
  				user = User.where(:phone_number => params[:phone_number])
  			end
  			if user.nil?
  				#@reward.errors.add(:base, "No Results found, try again")
  				render 'new'
  			else
  				membership = Membership.where(:user_id => user.id, :store_id => store.id).first
  				params[:reward][:membership_id] = membership.id
  				
				if params[:accrue]
					params[:reward][:accrued] = params[:reward][:amount].to_f * 10
					params[:reward][:redeemed] = 0
				elsif params[:redeem]
					params[:reward][:accrued] = 0
					params[:reward][:redeemed] = params[:reward][:amount].to_f * 10
				end
				@reward = Reward.new(reward_params)
				if @reward.save
          @reward = Reward.new
          render 'new'
        end
			end
		end

  end

  def show
  end

  private

  def reward_params
	params.require(:reward).permit(:membership_id, :receipt_no, :amount, :accrued, :redeemed)
  end
end
