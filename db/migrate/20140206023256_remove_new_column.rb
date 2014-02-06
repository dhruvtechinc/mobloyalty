class RemoveNewColumn < ActiveRecord::Migration
  def change
  	remove_column :users, :password_reset_sent_ar, :datetime
  	add_column :users, :password_reset_sent_at, :datetime
  end
end
