class Advisory < ApplicationRecord
  has_many :tools, dependent: :delete_all
  belongs_to :characterization
end
