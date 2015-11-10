require 'test_helper'

class CartItemsControllerTest < ActionController::TestCase
  
  def setup
    @cart_item = cart_items(:cart_item_one)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'CartItem.count' do
      post :create, cart_item: { total_price: 100 }
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'CartItem.count' do
      delete :destroy, id: @cart_item
    end
    assert_redirected_to login_url
  end
  
  test "should redirect update when not logged in" do
    assert_no_difference 'CartItem.count' do
      put :update, id: @cart_item
    end
    assert_redirected_to login_url
  end
  
end
