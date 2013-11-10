class RemoveStringFromRewards < ActiveRecord::Migration
  def change
    remove_column :rewards, :string, :string
  end
end
