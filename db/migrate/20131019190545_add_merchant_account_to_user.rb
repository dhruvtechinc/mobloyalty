class AddMerchantAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :merchant_account, :boolean, default: false
  end
end
