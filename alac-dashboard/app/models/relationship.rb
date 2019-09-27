class Relationship < ApplicationRecord
  belongs_to :actor
  belongs_to :characterization
  validates :participation_type, presence: true
end
