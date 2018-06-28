class Store < ActiveRecore::Base
  has_many :items
  belongs_to :list

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Store.all.find{|store| store.slug == slug}
  end
end
