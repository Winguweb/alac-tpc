class Characterization < ApplicationRecord

  has_many :evolutions 
  has_many :advisories
  has_many :relationships 
  has_many :actors, :through => :relationships

end
