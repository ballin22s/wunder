require 'test_helper'

class OrderStatusTest < ActiveSupport::TestCase
  
  def setup
    @order_status = OrderStatus.new(name: "In Progress")
  end

  test "should be valid" do
    assert @order_status.valid?
  end
  
  test "name should be present" do
    @order_status.name = "     "
    assert_not @order_status.valid?
  end
  
end
