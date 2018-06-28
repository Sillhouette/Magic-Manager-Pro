class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_items
  has_many :items, :through => :list_items

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Item.all.find{|item| item.slug == slug}
  end
end
