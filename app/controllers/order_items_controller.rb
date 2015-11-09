class OrderItemsController < ApplicationController
  
    def create
      @order = current_order
      @order.user = current_user
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      session[:order_id] = @order.id
    end

    def update
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      if @order_item.update_attributes(order_item_params)
        @order_items = @order.order_items
        @new_subtotal = current_order.subtotal
        @order_item.subtotal(@new_subtotal)
      end 
    end

    def destroy
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      if @order_item.destroy
        @order_items = @order.order_items
        @new_subtotal = current_order.subtotal
        @order_item.subtotal(@new_subtotal)
      end
    end
  
  private
    
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id)
    end
end
