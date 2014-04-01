class VendorProgramSetup < ActiveRecord::Base
	belongs_to :store
	belongs_to :vendor_program
end
