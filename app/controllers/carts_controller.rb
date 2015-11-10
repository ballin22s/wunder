class CartsController < ApplicationController
  before_filter :signed_in_user, only: [:show, :confirm_address, :confirm_payment]
  
  def show
    @cart_items = current_cart.cart_items
  end
  
  def confirm_address
    @user = current_user
  end

  private

    def signed_in_user
      unless logged_in?
        store_location
        redirect_to (login_path), notice: "Please sign in."
      end
    end
  
end
