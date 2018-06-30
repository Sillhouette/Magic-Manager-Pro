class ListItems < ActiveRecord::Base
  include Slug

  belongs_to :list
  belongs_to :item
end
