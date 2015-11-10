class CartsController < ApplicationController
    
  def show
    @cart_items = current_cart.cart_items
  end
  
  def confirm_address
    
  end
  
end
