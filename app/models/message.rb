class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :body, presence: true
end
