module VendorProgramSetupsHelper
	def daily_points_to_accrue
		@daily_points = VendorProgramSetup.where(:stores_id => current_user.stores.first.id, :vendor_programs_id => daily_rewards).first
		@daily_points_to_accrue = @daily_points.nil? ? nil : @daily_points.accrue_points_visits
	end
	def new_customer_points_to_accrue
		@new_customer_points = VendorProgramSetup.where(:stores_id => current_user.stores.first.id, :vendor_programs_id => new_customer_rewards).first
		@new_customer_points_to_accrue = @new_customer_points.nil? ? nil : @new_customer_points.accrue_points_visits
	end
	def punch_card_visits
		@punch_card = VendorProgramSetup.where(:stores_id => current_user.stores.first.id, :vendor_programs_id => punch_card_rewards).first
		@punch_card_visits = @punch_card.nil? ? nil : @punch_card.accrue_points_visits
	end
	def daily_points_to_redeem
		@daily_points = VendorProgramSetup.where(:stores_id => current_user.stores.first.id, :vendor_programs_id => daily_rewards).first
		@daily_points_to_redeem = @daily_points.nil? ? nil : @daily_points.reward_points_visits
	end
end
