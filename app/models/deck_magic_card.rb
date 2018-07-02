class DeckMagicCard < ActiveRecord::Base
  belongs_to :deck
  belongs_to :magic_card
end
