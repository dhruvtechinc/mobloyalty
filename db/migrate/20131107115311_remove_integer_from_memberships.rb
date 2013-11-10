class RemoveIntegerFromMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :integer, :string
  end
end
