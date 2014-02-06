class UserMailer < ActionMailer::Base
def password_reset(user)
  @user = user
	headers["Reply-to"] = "admin@mobloyalty.com"
  headers["Return-Path"] = "admin@mobloyalty.com" 
   mail(:to => user.email, :subject => "Password Reset", :from => "admin@mobloyalty.com") 
end
end