class User < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  has_many :decks
  has_many :magic_cards
  has_secure_password
end
