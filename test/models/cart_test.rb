require 'test_helper'

class CartTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:tom)
    @cart = @user.build_cart(subtotal: 100)    
  end
  
  test "should be valid" do
    assert @cart.valid?
  end
  
  test "user id should be present" do
    @cart.user_id = nil
    assert_not @cart.valid?
  end
  
end
