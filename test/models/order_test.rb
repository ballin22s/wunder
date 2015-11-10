require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:tom)
    @order = @user.orders.build(order_status_id: 1, subtotal: 100)    
  end
  
  test "should be valid" do
    assert @order.valid?
  end
  
  test "user id should be present" do
    @order.user_id = nil
    assert_not @order.valid?
  end
  
  test "order status id should be present" do
    @order.order_status_id = nil
    assert_not @order.valid?
  end
  
end
