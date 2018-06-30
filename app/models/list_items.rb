class ListItems < ActiveRecord::Base
  include slug
  
  belongs_to :list
  belongs_to :item
end
