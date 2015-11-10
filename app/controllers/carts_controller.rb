class CartsController < ApplicationController
    
  def show
    @cart_items = current_cart.cart_items
  end
  
  def confirm_address
    @user = current_user
  end
  
  def confirm_payment
    @user = current_user
  end
  
end
