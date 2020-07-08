class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :customer_items
  has_many :customers, through: :customer_items

  validates :image, presence: true
end
