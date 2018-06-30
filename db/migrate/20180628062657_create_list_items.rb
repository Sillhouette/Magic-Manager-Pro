class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :item_id
      t.string :store
      t.float :price
      t.integer :quantity
    end
  end
end
