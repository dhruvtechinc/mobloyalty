class VendorProgramsRemoveColumns < ActiveRecord::Migration
  def change
  	remove_column :vendor_program_setups, :store_id, :integer
  	remove_column :vendor_program_setups, :vendor_program_id, :integer
	end
end
