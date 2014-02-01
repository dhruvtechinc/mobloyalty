class QrcodesController < ApplicationController
  	before_action :signed_in_user
	require 'rqrcode'
	def index
		email_id = current_user.email
 		@qr = RQRCode::QRCode.new(email_id)
	end
end