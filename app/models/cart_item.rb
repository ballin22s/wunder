class CartItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :cart

    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validate :product_present
    validate :cart_present

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
    def product_present
      if product.nil?
        errors.add(:product, "is not valid or is not active.")
      end
    end

    def cart_present
      if cart.nil?
        errors.add(:cart, "is not a valid cart.")
      end
    end

    def finalize
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
    end
end
