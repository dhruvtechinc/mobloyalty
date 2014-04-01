class ChangeMembershipToInteger < ActiveRecord::Migration
  def change
  	remove_column :rewards, :membership_id, :string
  	add_column :rewards, :membership_id, :integer
  end
end
