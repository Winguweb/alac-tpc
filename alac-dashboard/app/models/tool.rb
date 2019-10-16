class Tool < ApplicationRecord
  mount_uploader :document, ToolUploader
  belongs_to :advisory
end
