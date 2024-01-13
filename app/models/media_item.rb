class MediaItem < ApplicationRecord
  belongs_to :room
  has_one_attached :item
end
