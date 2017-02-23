class Picture < ActiveRecord::Base
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
end
