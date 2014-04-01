module RewardsHelper
	def current_accrued_points(id)
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts id
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		current_accrued = Reward.where(:membership_id => id).order(updated_at: :desc).first
		@current_accrued_points = @current_accrued.nil? ? 0 : @current_accrued.accrued
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts @current_accrued_points
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		return @current_accrued_points
	end

	def total_accrued_points(id)
		@total_accrued_points = Reward.where(:membership_id => id).sum('accrued')
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts @total_accrued_points
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		return @total_accrued_points
	end

	def total_redeem_points(id)
		@total_redeem_points = Reward.where(:membership_id => id).sum('redeemed')
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts @total_redeem_points
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		return @total_redeem_points
	end

	def balance_points(id)
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts @total_accrued_points
		puts "wtf" + total_accrued_points(id).to_s
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts @total_redeem_points
		puts "wtf" + total_redeem_points(id).to_s
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		@balance_points = @total_accrued_points - @total_redeem_points
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		puts @balance_points
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
		return @balance_points
	end
end
