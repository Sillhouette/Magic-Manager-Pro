class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :store
      t.float :price
      t.integer :quantity
    end
  end
end
