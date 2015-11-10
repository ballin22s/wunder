require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  
  def setup
    @order = orders(:order_one)
  end
  
  test "should redirect index when not logged in" do
    get :index, id: @order
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect new when not logged in" do
    get :new, id: @order
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Order.count' do
      post :create, order: { subtotal: 100 }
    end
    assert_redirected_to login_url
  end
  
end
