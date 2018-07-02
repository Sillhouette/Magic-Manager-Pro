class User < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  has_many :decks, dependent: :destroy
  has_many :magic_cards, dependent: :destroy
  has_secure_password
end
