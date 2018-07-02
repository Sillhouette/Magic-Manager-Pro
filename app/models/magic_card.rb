class MagicCard < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  belongs_to :deck
  belongs_to :user

  QUALITIES = ["Mint", "Near Mint", "Lightly Played", "Moderately Played", "Heavily Played", "Unknown"]
  COLORS = ["Red", "Blue", "Green", "Black", "White", "Colorless"]
  TYPES = ["Land", "Creature", "Artifact", "Enchantment", "Planeswalker", "Sorcery", "Instant", "Equipment", "Vehicle"]
  SUPER_TYPES = ["Basic", "Elite" , "Host" , "Legendary", "Ongoing" , "Snow", "World"]
  RARITIES = ["Common", "Uncommon", "Rare", "Mythic Rare"]

  SETS = ["Alpha (Limited Edition)", "Beta (Limited Edition)", "Unlimited Edition", "Arabian Nights", "Antiquities", "Revised Edition", "Legends", "The Dark",
          "Fallen Empires", "Fourth Edition", "Ice Age", "Chronicles", "Renaissance", "Homelands", "Alliances", "Mirage", "Visions", "Fifth Edition", "Portal", "Weatherlight",
          "Tempest", "Stronghold", "Exodus", "Portal Second Age", "Unglued", "Urza's Saga", "Anthologies", "Urza's Legacy", "Sixth Edition", "Urza's Destiny", "Portal Three Kingdoms",
          "Starter 1999", "Mercadian Masques", "Battle Royale", "Nemesis", "Starter 2000", "Prophecy", "Invasion", "Beatdown", "Planeshift", "Seventh Edition", "Apocalypse", "Odyssey",
          "Deckmasters 2001", "Torment", "Judgment", "Onslaught", "Legions", "Scourge", "Eighth Edition", "Mirrodin", "Darksteel", "Fifth Dawn", "Champions of Kamigawa", "Unhinged",
          "Betrayers of Kamigawa", "Saviors of Kamigawa", "Ninth Edition", "Salvat 2005", "Ravnica: City of Guilds", "Guildpact", "Dissension", "Coldsnap", "Time Spiral", "Planar Chaos",
          "Future Sight", "Tenth Edition", "Masters Edition	", "Lorwyn", "Duel Decks: Elves vs. Goblins", "Morningtide", "Shadowmoor", "Eventide", "From the Vault: Dragons",
          "Masters Edition II", "Shards of Alara", "Duel Decks: Jace vs. Chandra", "Conflux", "Duel Decks: Divine vs. Demonic", "Alara Reborn", "Magic 2010", "Commander Theme Decks",
          "From the Vault: Exiled", "Planechase", "Masters Edition III", "Zendikar", "Duel Decks: Garruk vs. Liliana", "Premium Deck Series: Slivers", "Worldwake",
          "Duel Decks: Phyrexia vs. The Coalition", "Rise of the Eldrazi", "Deck Builder's Toolkit", "Duels of the Planeswalkers", "Archenemy", "Magic 2011",
          "From the Vault: Relics", "Duel Decks: Elspeth vs. Tezzeret", "Scars of Mirrodin", "Magic Online Deck Series", "Premium Deck Series: Fire & Lightning",
          "Momir Basic Event Deck", "Salvat 2011	", "Masters Edition IV", "Mirrodin Besieged", "Deck Builder's ", "Duel Decks: Knights vs. Dragons", "New Phyrexia",
          "Commander", "Magic 2012", "From the Vault: Legends", "Duel Decks: Ajani vs. Nicol Bolas", "Innistrad", "Premium Deck Series: Graveborn", "Dark Ascension",
          "Duel Decks: Venser vs. Koth", "Avacyn Restored", "Planechase 2012", "Magic 2013", "From the Vault: Realms", "Duel Decks: Izzet vs. Golgari", "Return to Ravnica",
          "Commander's Arsenal", "Duel Decks: Mirrodin Pure vs. New Phyrexia", "Gatecrash", "Duel Decks: Sorin vs. Tibalt", "Dragon's Maze", "Modern Masters", "Magic 2014",
          "From the Vault: Twenty", "Duel Decks: Heroes vs. Monsters", "Theros", "Commander 2013", "Born of the Gods", "Duel Decks: Jace vs. Vraska", "Journey into Nyx",
          "Modern Event Deck", "Conspiracy", "Vintage Masters", "Magic 2015", "From the Vault: Annihilation", "Duel Decks: Speed vs. Cunning", "Khans of Tarkir", "Commander 2014",
          "Duel Decks Anthology", "Fate Reforged", "Duel Decks: Elspeth vs. Kiora", "Dragons of Tarkir", "Tempest Remastered", "Modern Masters 2015", "Magic Origins",
          "From the Vault: Angels", "Duel Decks: Zendikar vs. Eldrazi", "Battle for Zendikar", "Zendikar Expeditions", "Commander 2015", "Legendary Cube", "Oath of the Gatewatch",
          "Duel Decks: Blessed vs. Cursed", "Welcome Deck 2016", "Shadows over Innistrad", "Eternal Masters", "Eldritch Moon	", "From the Vault: Lore", "Conspiracy: Take the Crown",
          "Duel Decks: Nissa vs. Ob Nixilis", "Kaladesh", "Kaladesh Inventions", "Treasure Chests", "Commander 2016", "You Make the Cube	", "Planechase Anthology", "Aether Revolt"	,
          "Modern Masters", "Duel Decks: Mind vs. Might", "Welcome Deck 2017", "Amonkhet", "Amonkhet Invocations", "Commander Anthology", "Archenemy: Nicol Bolas", "Hour of Devastation",
          "Commander 2017", "Ixalan", "Duel Decks: Merfolk vs. Goblins", "Iconic Masters", "Explorers of Ixalan", "From the Vault: Transform	", "Unstable", "Rivals of Ixalan", "Masters 25",
          "Duel Decks: Elves vs. Inventors", "Challenger Decks (2018)", "Dominaria", "Commander Anthology Volume II	", "Battlebond", "Signature Spellbook: Jace", "Global Series: Jiang Yanggu & Mu Yanling",
          "Core Set 2019", "Commander 2018", "Guilds of Ravnica	", "Ravnica Allegiance"]

  def self.qualities
    QUALITIES
  end

  def self.colors
    COLORS
  end

  def self.types
    TYPES
  end

  def self.super_types
    SUPER_TYPES
  end

  def self.rarities
    RARITIES
  end

  def self.sets
    SETS
  end
  #t.integer :deck_id - program defined
  #t.integer :user_id - program defined
  #t.string :name - user defined
  #t.string :quality - single choice from 6 options, mint, near mint, lightly played, moderately played, heavily played, unknown
  #t.boolean :foil - single choice, true or false/ yes or no
  #t.string :color - multi choice, red blue green black white colorless
  #t.string :types - multi choice, land, creature, artifact, enchantment, planeswalker, sorcery, instant, equipment, vehicle
  #t.string :super_types - multi choice Basic, Elite , Host , Legendary, Ongoing , Snow, World
  #t.string :rarity - single choice, common, uncommon, rare and mythic rare
  #t.string :manna_cost - user defined EX: 2 red 1 colorless = 1RR
  #t.float :value - user defined
  #t.integer :quantity - user defined
  #t.string :set - single choice from the below list
      #Alpha (Limited Edition), Beta (Limited Edition), Unlimited Edition, Arabian Nights, Antiquities, Revised Edition, Legends, The Dark,
      #Fallen Empires, Fourth Edition, Ice Age, Chronicles, Renaissance, Homelands, Alliances, Mirage, Visions, Fifth Edition, Portal, Weatherlight,
      #Tempest, Stronghold, Exodus, Portal Second Age, Unglued, Urza's Saga, Anthologies, Urza's Legacy, Sixth Edition, Urza's Destiny, Portal Three Kingdoms,
      #Starter 1999, Mercadian Masques, Battle Royale, Nemesis, Starter 2000, Prophecy, Invasion, Beatdown, Planeshift, Seventh Edition, Apocalypse, Odyssey,
      #Deckmasters 2001, Torment, Judgment, Onslaught, Legions, Scourge, Eighth Edition, Mirrodin, Darksteel, Fifth Dawn, Champions of Kamigawa, Unhinged,
      #Betrayers of Kamigawa, Saviors of Kamigawa, Ninth Edition, Salvat 2005, Ravnica: City of Guilds, Guildpact, Dissension, Coldsnap, Time Spiral, Planar Chaos,
      #Future Sight, Tenth Edition, Masters Edition	, Lorwyn, Duel Decks: Elves vs. Goblins, Morningtide, Shadowmoor, Eventide, From the Vault: Dragons,
      #Masters Edition II, Shards of Alara, Duel Decks: Jace vs. Chandra, Conflux, Duel Decks: Divine vs. Demonic, Alara Reborn, Magic 2010, Commander Theme Decks,
      #From the Vault: Exiled, Planechase, Masters Edition III, Zendikar, Duel Decks: Garruk vs. Liliana, Premium Deck Series: Slivers, Worldwake,
      #Duel Decks: Phyrexia vs. The Coalition, Rise of the Eldrazi, Deck Builder's Toolkit, Duels of the Planeswalkers, Archenemy, Magic 2011,
      #From the Vault: Relics, Duel Decks: Elspeth vs. Tezzeret, Scars of Mirrodin, Magic Online Deck Series, Premium Deck Series: Fire & Lightning,
      #Momir Basic Event Deck, Salvat 2011	, Masters Edition IV, Mirrodin Besieged, Deck Builder's , Duel Decks: Knights vs. Dragons, New Phyrexia,
      #Commander, Magic 2012, From the Vault: Legends, Duel Decks: Ajani vs. Nicol Bolas, Innistrad, Premium Deck Series: Graveborn, Dark Ascension,
      #Duel Decks: Venser vs. Koth, Avacyn Restored, Planechase 2012, Magic 2013, From the Vault: Realms, Duel Decks: Izzet vs. Golgari, Return to Ravnica,
      #Commander's Arsenal, Duel Decks: Mirrodin Pure vs. New Phyrexia, Gatecrash, Duel Decks: Sorin vs. Tibalt, Dragon's Maze, Modern Masters, Magic 2014,
      #From the Vault: Twenty, Duel Decks: Heroes vs. Monsters, Theros, Commander 2013, Born of the Gods, Duel Decks: Jace vs. Vraska, Journey into Nyx,
      #Modern Event Deck, Conspiracy, Vintage Masters, Magic 2015, From the Vault: Annihilation, Duel Decks: Speed vs. Cunning	, Khans of Tarkir, Commander 2014,
      #Duel Decks Anthology, Fate Reforged, Duel Decks: Elspeth vs. Kiora, Dragons of Tarkir, Tempest Remastered, Modern Masters 2015, Magic Origins,
      #From the Vault: Angels, Duel Decks: Zendikar vs. Eldrazi, Battle for Zendikar	, Zendikar Expeditions, Commander 2015, Legendary Cube, Oath of the Gatewatch,
      #Duel Decks: Blessed vs. Cursed, Welcome Deck 2016, Shadows over Innistrad, Eternal Masters, Eldritch Moon	, From the Vault: Lore, Conspiracy: Take the Crown,
      #Duel Decks: Nissa vs. Ob Nixilis, Kaladesh, Kaladesh Inventions, Treasure Chests, Commander 2016, You Make the Cube	, Planechase Anthology, Aether Revolt	,
      #Modern Masters, Duel Decks: Mind vs. Might, Welcome Deck 2017, Amonkhet, Amonkhet Invocations, Commander Anthology, Archenemy: Nicol Bolas, Hour of Devastation,
      #Commander 2017, Ixalan, Duel Decks: Merfolk vs. Goblins, Iconic Masters, Explorers of Ixalan, From the Vault: Transform	, Unstable, Rivals of Ixalan, Masters 25,
      #Duel Decks: Elves vs. Inventors, Challenger Decks (2018), Dominaria	, Commander Anthology Volume II	, Battlebond, Signature Spellbook: Jace, Global Series: Jiang Yanggu & Mu Yanling,
      #Core Set 2019, Commander 2018, Guilds of Ravnica	, Ravnica Allegiance
  #t.boolean :side_board_option
  #t.boolean :main_board_option
end
