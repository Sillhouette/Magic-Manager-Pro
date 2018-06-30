module Slugable
  module InstanceMethods
    def slug(name)
      name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      self.all.find{|item| item.slug == slug}
    end
  end
end
