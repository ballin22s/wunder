class OrdersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :create]
  
  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders.order(:created_at)
  end

  def new
    @order = Order.new
    @order.user_id = current_user.id
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save_with_payment(current_cart.subtotal)
      current_cart.cart_items.each do |item|
        OrderItem.create!(
          order_id: @order.id,
          product_id: item.product_id,
          unit_price: item.unit_price,
          quantity: item.quantity,
          total_price: item.total_price
        )
      end
      current_cart.cart_items.destroy_all
      current_cart.subtotal = 0.00
      current_cart.save
      flash[:success] = "Thanks for your purchase."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private

    def order_params
      params.require(:order).permit(:user_id, :order_status_id, :subtotal, :tax, :shipping, :total, 
                                    :card_token, :stripe_card_token,
                                    order_item_attributes: [:id])
    end

    def signed_in_user
      unless logged_in?
        store_location
        redirect_to (login_url), notice: "Please sign in."
      end
    end
  
end
