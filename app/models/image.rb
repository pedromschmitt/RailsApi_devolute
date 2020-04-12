class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates_presence_of :user_id
end
