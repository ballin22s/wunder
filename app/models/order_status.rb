class OrderStatus < ActiveRecord::Base
  
  #Relationships
  has_many :orders
  
  #Callbacks
  validates :name,  presence: true, length: { maximum: 50 }
  
end
