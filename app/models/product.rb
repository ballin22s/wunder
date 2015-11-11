class Product < ActiveRecord::Base
  
  #Relationships
  has_many :cart_items
  has_many :order_items
  
  #Scope
  default_scope { where(active: true) }
  
  #Validations
  validates :title,  presence: true, length: { maximum: 50 }
  validates :price,  presence: true
  validates :release_year,  presence: true
  
end
