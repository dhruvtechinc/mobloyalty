class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :user_id
      t.string :integer
      t.string :store_id
      t.string :integer

      t.timestamps
    end
  end
end
