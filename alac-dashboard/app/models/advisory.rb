class Advisory < ApplicationRecord
  has_many :tools
  belongs_to :characterization
end
