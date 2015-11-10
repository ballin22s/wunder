require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  
  def setup
    @cart = carts(:cart)
  end
  
  test "should redirect show when not logged in" do
    get :show, id: @cart
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect confirm address when not logged in" do
    get :confirm_address, id: @cart
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
end
