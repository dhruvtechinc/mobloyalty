class RemoveColumns < ActiveRecord::Migration
  def change
  	remove_column :rewards, :amount, :string
  	remove_column :rewards, :accrued, :string
  	remove_column :rewards, :redeemed, :string
  	add_column :rewards, :amount, :integer
  	add_column :rewards, :accrued, :integer
  	add_column :rewards, :redeemed, :integer  
  end
end
