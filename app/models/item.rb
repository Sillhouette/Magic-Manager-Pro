class Item < ActiveRecord::Base
  has_many :list_items
  has_many :lists, :through => :list_items
  has_many :users, :through => :lists

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Item.all.find{|item| item.slug == slug}
  end
end
