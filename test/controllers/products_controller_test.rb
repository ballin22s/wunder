require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  def setup
    @product = products(:one)
    @product_two = products(:two)
    @user = users(:tom)
    @other_user = users(:archer)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end
  
  test "should redirect new when not logged in" do
    get :new
    assert_redirected_to login_url
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end
  
  test "should redirect new when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Product.count' do
      get :new, id: @product
    end
    assert_redirected_to root_url
  end

  test "should create product" do
    log_in_as(@user)
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, price: @product.price, release_year: @product.release_year, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end
  
  test "should redirect create when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Product.count' do
      post :create, id: @product
    end
    assert_redirected_to root_url
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get :edit, id: @product
    assert_response :success
  end
  
  test "should redirect edit when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Product.count' do
      get :edit, id: @product
    end
    assert_redirected_to root_url
  end

  test "should update product" do
    log_in_as(@user)
    patch :update, id: @product, product: { description: @product.description, price: @product.price, release_year: @product.release_year, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end
  
  test "should redirect update when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Product.count' do
      put :update, id: @product
    end
    assert_redirected_to root_url
  end

  test "should destroy product" do
    log_in_as(@user)
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Product.count' do
      delete :destroy, id: @product
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Product.count' do
      delete :destroy, id: @product
    end
    assert_redirected_to root_url
  end

end
