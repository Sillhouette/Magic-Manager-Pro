class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.string :format
      t.integer :user_id
      t.integer :card_count
      t.integer :creature_count
      t.integer :instant_sorcery_count
      t.integer :land_count
      t.integer :artifact_enchantment_count
      t.integer :planeswalker_count
      t.integer :sideboard_count
    end
  end
end
