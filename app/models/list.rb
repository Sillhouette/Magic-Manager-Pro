class List < ActiveRecore::Base
  has_many :stores
  has_many :items, :through :stores
end
