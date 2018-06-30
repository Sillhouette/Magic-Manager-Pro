class User < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  has_many :lists
  has_many :items, :through => :lists
  has_secure_password
end
