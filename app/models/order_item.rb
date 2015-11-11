class OrderItem < ActiveRecord::Base
  
  #Relationships
  belongs_to :product
  belongs_to :order
  
  #Validations
  validates :product_id, presence: true
  validates :order_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
end
