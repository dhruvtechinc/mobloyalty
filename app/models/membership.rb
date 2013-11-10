class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :store
	has_many :rewards
end
