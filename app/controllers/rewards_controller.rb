class RewardsController < ApplicationController
  before_action :signed_in_user
  #before_action :correct_user, except: [:create]
  def new
  	@reward = Reward.new
    if !params[:email].blank?
      @reward.email = params[:email]
    end
  end

  def create

      ar = params[:accrue] ? params[:accrue]["Accrue"] : params[:redeem]["Redeem"]
      # Error if both email and phone number are blank
      if params[:reward][:email].blank? && params[:reward][:phone_number].blank?
        flash[:error] = "Please Enter either Email or Phone number"
        redirect_to rewards_new_path(ar: ar)
        return
      end
      # Error if both email and phone number are present
      if !params[:reward][:email].blank? && !params[:reward][:phone_number].blank?
        flash[:error] = "Please Enter only Email or Phone number, not both"
        redirect_to rewards_new_path(ar: ar)
        return
      end
      # Validate email, if present
      if !params[:reward][:email].blank? && !validate_email?(params[:reward][:email])
        flash[:error] = "Please Enter valid Email Address"
        redirect_to rewards_new_path(ar: ar)
        return
      end
      # Validate phone number, if present
      if !params[:reward][:phone_number].blank? && !validate_phone?(params[:reward][:phone_number])
        flash[:error] = "Please Enter valid Phone Number"
        redirect_to rewards_new_path(ar: ar)
        return
      end

      @reward = Reward.new
      # Get store from logged in user
      store  = current_user.stores.first

      # Find customer/user for Accrue or Redeem, using either email or phone num
      if params[:accrue] || params[:redeem]
        if !params[:reward][:email].empty?
          user = User.where(:email => params[:reward][:email]).first
        end
        if !params[:reward][:phone_number].empty?
          user = User.where(:phone_number => params[:reward][:phone_number]).first
        end
        
        puts user.inspect
        # Error if user not present 
        if user.nil?
          flash[:error] = "We were unable to locate the user. Is the user a MobLoyalty member yet?"
          redirect_to rewards_new_path(ar: ar)
        else
          membership = Membership.where(:user_id => user.id, :store_id => store.id).first
          
          puts membership.inspect

          if !membership
            membership = Membership.new(user_id: user.id, store_id: store.id)
            if membership.save
              flash[:notice] = "We have successfully associated you to our store."
            else
              flash[:notice] = "Bad Doghnut"
            end

          end
          params[:reward][:membership_id] = membership.id
          msg = ""
          if params[:accrue]
            accrue_now = params[:reward][:amount].to_f * 10
            params[:reward][:accrued] = accrue_now
            params[:reward][:redeemed] = 0
            msg = user.first_name + " " + user.last_name + " Successfully added " + accrue_now.to_s + " points."
          elsif params[:redeem]
            accrue = Reward.where(:membership_id => membership.id).sum('accrued')
            points = params[:reward][:amount].to_f * 10
            if points <= accrue
              params[:reward][:accrued] = 0
              params[:reward][:redeemed] = points
              msg = user.first_name + " " + user.last_name + " Successfully redeemed points."
            else
              msg = "Not enough points available to redeem."
            end
          end
          @reward = Reward.new(reward_params)
          if @reward.save
            @reward = Reward.new
            flash[:success] = msg
          else
            flash[:error] = @reward.errors.full_messages.clone
          end
            redirect_to rewards_new_path(ar: ar)

        end
      end
  end
  def validate_email?(email)
    if email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      return true
    else
      return false
    end
      
  end

  def validate_phone?(phone)
    if phone.length != 10
      return false
    end
    Float(phone) != nil rescue false        
  end

     def show
    end

    private

    def reward_params
      params[:reward][:phone_number] = params[:reward][:phone_number].delete("^0-9")
      params.require(:reward).permit(:email, :phone_number, :membership_id, :receipt_no, :amount, :accrued, :redeemed)
   end
 end
