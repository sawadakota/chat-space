class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :body, presence: true

  belongs_to :user
  belongs_to :group

end
