class AddCustomerRegistrationStore < ActiveRecord::Migration
  def change
  	add_column :users, :initial_signup_store_id, :string
  	add_column :stores, :store_logo, :string
  end
end
