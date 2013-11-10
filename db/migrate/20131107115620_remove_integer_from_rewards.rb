class RemoveIntegerFromRewards < ActiveRecord::Migration
  def change
    remove_column :rewards, :integer, :string
  end
end
