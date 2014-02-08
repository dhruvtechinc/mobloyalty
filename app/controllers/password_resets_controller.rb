class PasswordResetsController < ApplicationController
def new
end
def create
  user = User.find_by_email(params[:email])
  user.send_password_reset if user
  flash[:signin_info] = "Email sent with password reset instructions."
  redirect_to root_url
end

def edit
  @user = User.find_by_password_reset_token!(params[:id]) rescue nil
  if @user.nil?
    flash[:signin_info] = "Password reset has expired. Try again."
    redirect_to new_password_reset_path
  end
end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    flash[:signin_info] = "Password reset has expired. Try again."
    redirect_to new_password_reset_path
  elsif @user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
    flash[:signin_info] = "Password has been reset!"
    redirect_to root_url
  else
    render :edit
  end
end
private
        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            params.require(:user).permit(:post_id, :comment, :body)
        end

end