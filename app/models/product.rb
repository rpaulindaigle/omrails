class Product < ActiveRecord::Base
  attr_accessible :description, :image, :brand, :price, :sale_price, :material

  validates :description, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  validates :sale_price, presence: true
  validates :material, presence: true


  validates :user_id, presence: true

  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
  belongs_to :user
  has_attached_file :image, styles: { medium: "320x240>"}
end