module VendorProgramsHelper
	def daily_rewards
		@daily_rewards ||= VendorProgram.find_by_id(4)
	end
	def new_customer_rewards
		@new_customer_rewards ||= VendorProgram.find_by_id(2)
	end
	def punch_card_rewards
		@punch_card_rewards ||= VendorProgram.find_by_id(1)
	end
end
