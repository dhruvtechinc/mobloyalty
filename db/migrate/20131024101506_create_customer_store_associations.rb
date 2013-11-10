class CreateCustomerStoreAssociations < ActiveRecord::Migration
  def change
    create_table :customer_store_associations do |t|
      t.string :user_id
      t.string :integer
      t.string :store_id
      t.string :integer

      t.timestamps
    end
  end
end
