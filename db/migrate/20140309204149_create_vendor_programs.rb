class CreateVendorPrograms < ActiveRecord::Migration
  def change
    create_table :vendor_programs do |t|
      t.string :type_code
      t.string :type_desc

      t.timestamps
    end
  end
end
