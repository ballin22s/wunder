class CartItemsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :update, :destroy]
  
  def create
    @cart = current_cart
    @cart.user = current_user
    @cart_item = @cart.cart_items.new(cart_item_params)
    @cart.save
    session[:order_id] = @cart.id
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update_attributes(cart_item_params)
      @cart_items = @cart.cart_items
      @new_subtotal = current_cart.subtotal
      @cart_item.subtotal(@new_subtotal)
    end 
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.destroy
      @cart_items = @cart.cart_items
      @new_subtotal = current_cart.subtotal
      @cart_item.subtotal(@new_subtotal)
    end
  end

  private
  
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :product_id)
    end
    
    def signed_in_user
      unless logged_in?
        store_location
        redirect_to (login_path), notice: "Please sign in."
      end
    end
  
end
