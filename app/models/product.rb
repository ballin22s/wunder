class Product < ActiveRecord::Base
  has_many :order_items
  
  default_scope { where(active: true) }
  
  validates :title,  presence: true, length: { maximum: 50 }
  validates :price,  presence: true
  validates :release_year,  presence: true
  
end
