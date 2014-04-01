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
      # what param is passed in the url
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
      #puts "############################################################################"
      #puts current_user.inspect
      store  = current_user.stores.first
      #puts store.inspect
      #puts "############################################################################"
      # Find customer/user for Accrue or Redeem, using either email or phone num
      if params[:accrue] || params[:redeem]
        if !params[:reward][:email].empty?
          user = User.where(:email => params[:reward][:email]).first
        end
        if !params[:reward][:phone_number].empty?
          user = User.where(:phone_number => params[:reward][:phone_number]).first
        end
        
        #puts user.inspect
        # Error if user not present 
        if user.nil?
          flash[:error] = "We were unable to locate the user. Is the user a MobLoyalty member yet?"
          redirect_to rewards_new_path(ar: ar)
        else
          membership = Membership.where(:user_id => user.id, :store_id => store.id).first
          
          #puts membership.inspect
          new_customer = false
          if !membership
            membership = Membership.new(user_id: user.id, store_id: store.id)
            if membership.save
              flash[:notice] = "We have successfully associated you to our store."
              new_customer = true
            else
              flash[:notice] = "Bad Doghnut"
            end

          end
          params[:reward][:membership_id] = membership.id.to_i
          msg = ""
          bp = balance_points(membership.id)
          #current_accrued_points = Reward.where(:membership_id => membership.id).order(updated_at: :desc).first.nil? ? 0 : current_accrued_points
          #vendor_program_setup = VendorProgramSetup.where(:stores_id => @store.id, :vendor_programs_id => 2).first
          if params[:accrue]
            #if store.id == 2 #hack for Smile Salon
            if daily_points_to_accrue.nil?
              accrue_now = params[:reward][:amount].to_i * 1
            else
              points_to_accrue = 0
              if new_customer == true && !new_customer_points_to_accrue.nil?
                points_to_accrue += new_customer_points_to_accrue
              end
              points_to_accrue += params[:reward][:amount].to_i * daily_points_to_accrue
              accrue_now = points_to_accrue.to_i
            end
            params[:reward][:accrued] = accrue_now
            params[:reward][:redeemed] = 0
            msg = user.first_name + " " + user.last_name + " Successfully added " + accrue_now.to_s + " points."
          elsif params[:redeem]
            #accrue = Reward.where(:membership_id => membership.id).sum('accrued')
            points_to_redeem = params[:reward][:redeemed].to_i
            if points_to_redeem > bp
              flash[:error] = "Not enough points available to redeem."
              redirect_to rewards_new_path(ar: ar)
              return
            elsif !daily_points_to_redeem.nil? && points_to_redeem != daily_points_to_redeem
              flash[:error] = "Customer can only redeem " + daily_points_to_redeem.to_s + " points"
              redirect_to rewards_new_path(ar: ar)
              return
            else #points_to_redeem <= bp
              params[:reward][:accrued] = 0
              params[:reward][:amount] = 0
              msg = user.first_name + " " + user.last_name + " Successfully redeemed points."
            end
          end
          @reward = Reward.new(reward_params)
          if @reward.save
            @reward = Reward.new
            total_available_points = balance_points(membership.id)
            msg += "<br/>Total Available Points: " + total_available_points.to_s
            flash[:success] = msg.html_safe
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
