class Picture < ActiveRecord::Base
  validates :caption, presence: true

  belongs_to :user
end
