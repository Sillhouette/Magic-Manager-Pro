class User < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  has_many :decks
  has_many :cards
  has_secure_password
end
