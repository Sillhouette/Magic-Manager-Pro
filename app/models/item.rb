class Item < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  has_many :list_items
  has_many :lists, :through => :list_items
  has_many :users, :through => :lists
end
