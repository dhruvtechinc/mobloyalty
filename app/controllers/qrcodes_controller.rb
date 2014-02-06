class QrcodesController < ApplicationController
  	before_action :signed_in_user
	require 'rqrcode'
	def index
		#url = "https://www.mobloyalty.com/rewards/new?ar=Accrue&email=john.doe@hotmail.com"
		email_id = current_user.email
		@qr = RQRCode::QRCode.new(email_id)
 		#@qr = RQRCode::QRCode.new(url, :size => 8, :level => :h)
	end
end