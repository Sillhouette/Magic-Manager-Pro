class ListItems < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  belongs_to :list
  belongs_to :item
end
