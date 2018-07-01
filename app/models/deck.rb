class List < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  belongs_to :user
  has_many :cards

  #t.string :name - User defined
  #t.string :format - Single Choice between:
      #Standard, Modern, Legacy, Vintage, Sealed Deck, Booster Draft, Rochester Draft,
      #Two-Headed Giant, Pauper, Peasant, Frontier, Rainbow Stairwell, Singleton, Tribal Wars,
      #Cube Draft, Back Draft, Reject Rare Draft, Type 4, Free-For-All, Star, Assassin, Emperor,
      #Vanguard, Planar Magic, Archenemy, Commander, Brawl, Mental Magic, Mini-Magic, Horde Magic,
      #QL Magic, Fat Stack/Tower of Power, Pack War, Penny Dreadful, Commander Adventures, Old School
  #t.integer :user_id - program defined
  #t.integer :card_count - min 60 unless commander then min is 100
  #t.integer :creature_count - count of creature cards
  #t.integer :instant_sorcery_count - count of instant/sorcery cards
  #t.integer :land_count - count of land cards
  #t.integer :artifact_enchantment_count - count of artifact/enchantment cards
  #t.integer :planeswalker_count - count of planeswalker cards
  #t.integer :sideboard_count - count of sideboard cards max of 15

  # max number of a specific card in a deck&sideboard is 4 unless it is restricted in a specific format then it is 1
  # some formats have banned cards as well
  # Basic lands have no limit to number in a deck, any other lands are limited to 4 per deck
  
end
