class AddIndexToMembeprshipsUserIdStoreId < ActiveRecord::Migration
  def change
  	add_index :memberships, [:user_id, :store_id], unique: true
  end
end
