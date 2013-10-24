class AddStorePhoneNumberToStores < ActiveRecord::Migration
  def change
    add_column :stores, :store_phone_number, :string
  end
end
