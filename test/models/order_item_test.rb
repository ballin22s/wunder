require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  
  def setup
    @order = orders(:order_one)
    @order_item = @order.order_items.build(product_id: 1, order_id: 1, quantity: 2)
  end
  
  test "should be valid" do
    assert @order_item.valid?
  end
  
  test "order item cart id should be present" do
    @order_item.order_id = nil
    assert_not @order_item.valid?
  end
  
  test "order item product id should be present" do
    @order_item.product_id = nil
    assert_not @order_item.valid?
  end
  
  test "order item quantity should be present" do
    @order_item.quantity = nil
    assert_not @order_item.valid?
  end
    
end
