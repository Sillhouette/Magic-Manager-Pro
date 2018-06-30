class List < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  belongs_to :user
  has_many :list_items
  has_many :items, :through => :list_items
end
