class Room < ApplicationRecord
  belongs_to :user
  has_many :media_items
end
