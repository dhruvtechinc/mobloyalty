class AddCustomerAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :customer_account, :boolean, default: true
  end
end
