require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product = Product.new(title: "Soda", release_year: 2007,
                     price: 1.50, description: "foobar")
  end
  
  test "should be valid" do
    assert @product.valid?
  end
  
  test "title should be present" do
    @product.title = "     "
    assert_not @product.valid?
  end
  
  test "title should not be too long" do
    @product.title = "a" * 51
    assert_not @product.valid?
  end
  
  test "year should be present" do
    @product.release_year = "     "
    assert_not @product.valid?
  end
  
  test "price should be present" do
    @product.price = "     "
    assert_not @product.valid?
  end
  
end
