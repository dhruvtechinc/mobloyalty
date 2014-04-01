class CreateVendorProgramSetups < ActiveRecord::Migration
  def change
    create_table :vendor_program_setups do |t|
      t.belongs_to :stores, :vendor_programs
      t.integer :accrue_points_visits
      t.integer :reward_points_visits
      t.string :reward_type_desc
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
