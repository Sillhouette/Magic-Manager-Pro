class DeckMagicCards < ActiveRecord::Migration
  def change
    create_table :deck_magic_cards do |t|
      t.integer :deck_id
      t.integer :magic_card_id
    end
  end
end
