class OrderStatus < ActiveRecord::Base
  has_many :orders
  
  validates :name,  presence: true, length: { maximum: 50 }
  
end
