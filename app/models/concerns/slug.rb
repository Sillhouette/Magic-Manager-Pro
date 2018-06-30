module Slug
  def slug(name)
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|item| item.slug == slug}
  end
end
