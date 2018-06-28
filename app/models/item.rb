class Item < ActiveRecore::Base
  belongs_to :store

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Item.all.find{|item| item.slug == slug}
  end
end
