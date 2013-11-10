class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :membership_id
      t.string :integer
      t.string :receipt_no
      t.string :string
      t.string :amount
      t.string :integer
      t.string :accrued
      t.string :integer
      t.string :redeemed
      t.string :integer

      t.timestamps
    end
  end
end
