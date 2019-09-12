class Actor < ApplicationRecord
  has_many :relationships
  has_many :characterizations, :through => :relationships
  has_many :evolutions
end
  