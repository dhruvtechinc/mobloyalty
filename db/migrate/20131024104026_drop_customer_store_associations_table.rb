class DropCustomerStoreAssociationsTable < ActiveRecord::Migration
def up
    drop_table :customer_store_associations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
 end
