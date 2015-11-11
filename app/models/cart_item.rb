class CartItem < ActiveRecord::Base
    
    #Relationships
    belongs_to :product
    belongs_to :cart

    #Validations
    validates :product_id, presence: true
    validates :cart_id, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

    #Callbacks
    before_save :finalize
    
    #Unite Price
    def unit_price
      if persisted?
        self[:unit_price]
      else
        product.price
      end
    end

    #Item Total Price
    def total_price
      unit_price * quantity
    end
    
    #Cart Subtotal
    def subtotal(subtotal)      
      self.cart.update_column(:subtotal, subtotal)
    end

  private

    #Finalize Total Price
    def finalize
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
    end
end
