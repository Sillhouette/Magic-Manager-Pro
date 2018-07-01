class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.integer :user_id
      t.string :name
      t.string :quality
      t.boolean :foil
      t.string :color
      t.string :types
      t.string :sub_types
      t.string :super_types
      t.string :rarity
      t.string :manna_cost
      t.float :value
      t.integer :quantity
      t.string :set
      t.boolean :side_board_option
      t.boolean :main_board_option
      #t.string :card_image
      #t.float :max_value
      #t.float :min_value
      #t.float :market_value
      #t.string :modern_format
      #t.string :standard_format
      #t.string :legacy_format
      #t.string :vintage_format
      #t.string :pauper_format
      #t.string :peasant_format
      #t.string :commander_multiplayer_format
      #t.string :commander_1v1_format
      #t.string :old_school_format_eu
      #t.string :old_school__us
    end
  end
end
