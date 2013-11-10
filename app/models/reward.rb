class Reward < ActiveRecord::Base
	belongs_to :membership
	attr_accessor :email, :phone_number
	def initializer
		email = ""
		phone_number = ""
	end
end
