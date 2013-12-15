class RewardsController < ApplicationController
  before_action :signed_in_user
  #before_action :correct_user, except: [:create]
  def new
  	@reward = Reward.new
  end

  def create
  		#user = 
  		@reward = Reward.new
  		store  = current_user.stores.first
  		if params[:accrue] || params[:redeem]
  			if !params[:reward][:email].empty?
  				user = User.where(:email => params[:reward][:email]).first
  			end
  			if !params[:reward][:phone_number].empty?
  				user = User.where(:phone_number => params[:phone_number])
  			end
  			if user.nil?
  				@reward.errors.add(:base, "We were not able to locate the user. Is the user a MobLoyalty member yet?")
  				render 'new'
  			else
  				membership = Membership.where(:user_id => user.id, :store_id => store.id).first
          if !membership
            membership = Membership.new(user_id: userId, store_id: storeId)
                if membership.save
                  flash[:notice] = "We have successfully associated you to our store."
                else
                  flash[:notice] = "Bad Doghnut"
                end

          end
  				params[:reward][:membership_id] = membership.id
  				
				if params[:accrue]
          accrue_now = params[:reward][:amount].to_f * 10
					params[:reward][:accrued] = accrue_now
					params[:reward][:redeemed] = 0
          flash[:accrued_success] = user.first_name + " " + user.last_name + " Successfully added " + accrue_now.to_s + " points."
				elsif params[:redeem]
          accrue = Reward.where(:membership_id => membership.id).sum('accrued')
          points = params[:reward][:amount].to_f * 10
          if points <= accrue
            params[:reward][:accrued] = 0
            params[:reward][:redeemed] = points
            flash[:redeemed_error] = user.first_name + " " + user.last_name + " Successfully redeemed points."
          else
            flash[:redeemed_success] = "Not enough points available to redeem."
          end
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
