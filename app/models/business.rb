class Business < ActiveRecord::Base
	VALID_PHONE_NUM = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
	validates :phone_number, allow_blank: true, format: { with: VALID_PHONE_NUM } #length: { minimum:10, maximum: 10 }
	validates :name, presence: true, length: { maximum: 100 }
	validates :address, presence: true, length: { maximum: 100 }
	validates :city, presence: true, length: { maximum: 50 }
	validates :state, presence: true, length: { maximum: 25 }
	validates :zip, presence: true, length: { maximum: 5 }

end
