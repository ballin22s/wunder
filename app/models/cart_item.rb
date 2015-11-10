class CartItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :cart

    validates :product_id, presence: true
    validates :cart_id, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

    before_save :finalize

    def unit_price
      if persisted?
        self[:unit_price]
      else
        product.price
      end
    end

    def total_price
      unit_price * quantity
    end
    
    def subtotal(subtotal)      
      self.cart.update_column(:subtotal, subtotal)
    end

  private

    def finalize
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
    end
end
