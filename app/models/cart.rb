class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  
  before_save :update_subtotal
  
  validates :user_id, presence: true
  
  def subtotal
    cart_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  
  private
  
    def update_subtotal
      self.subtotal = subtotal
    end
  
end
