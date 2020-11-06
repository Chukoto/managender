class DropLikes < ActiveRecord::Migration[6.0]
  def up
    drop_table :likes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
