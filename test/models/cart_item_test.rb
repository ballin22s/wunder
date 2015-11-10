require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  
  def setup
    @cart = carts(:cart)
    @cart_item = @cart.cart_items.build(product_id: 1, cart_id: 1, quantity: 2)
  end
  
  test "should be valid" do
    assert @cart_item.valid?
  end
  
  test "cart item cart id should be present" do
    @cart_item.cart_id = nil
    assert_not @cart_item.valid?
  end
  
  test "cart item product id should be present" do
    @cart_item.product_id = nil
    assert_not @cart_item.valid?
  end
  
  test "cart item quantity should be present" do
    @cart_item.quantity = nil
    assert_not @cart_item.valid?
  end
  
end
