class User < ActiveRecord::Base
  include slug

  has_many :lists
  has_many :items, :through => :lists
  has_secure_password
end
