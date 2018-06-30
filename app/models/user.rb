class User < ActiveRecord::Base
  include Slug

  has_many :lists
  has_many :items, :through => :lists
  has_secure_password
end
