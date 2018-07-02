class CreateMagicCards < ActiveRecord::Migration
  def change
    create_table :magic_cards do |t|
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
      t.boolean :side_board_option #Should be in the join table
      t.boolean :main_board_option #should be in the join table
      t.boolean :standard
      t.boolean :modern
      t.boolean :legacy
      t.boolean :vintage
      t.boolean :sealed_deck
      t.boolean :booster_draft
      t.boolean :rochester_draft
      t.boolean :two_headed_giant
      t.boolean :pauper
      t.boolean :peasant
      t.boolean :frontier
      t.boolean :rainbow_stairwell
      t.boolean :singleton
      t.boolean :tribal_wars
      t.boolean :cube_draft
      t.boolean :back_draft
      t.boolean :reject_rare_draft
      t.boolean :type_4
      t.boolean :free_for_all
      t.boolean :star
      t.boolean :assassin
      t.boolean :emperor
      t.boolean :vanguard
      t.boolean :planar_magic
      t.boolean :archenemy
      t.boolean :commander
      t.boolean :brawl
      t.boolean :mental_magic
      t.boolean :mini_magic
      t.boolean :horde_magic
      t.boolean :ql_magic
      t.boolean :fat_stack_tower_of_power
      t.boolean :pack_war
      t.boolean :penny_dreadful
      t.boolean :commander_adventures
      t.boolean :old_school
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
