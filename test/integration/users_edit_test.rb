require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tom)
  end
  
  test "unsuccessful profile edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "foo@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
  end

  test "successful profile edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to root_url
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { name:  name,
                                    email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to edit_user_path(@user)
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
  
  # test "successful address edit with friendly forwarding" do
  #   get address_user_path(@user)
  #   log_in_as(@user)
  #   assert_redirected_to root_url
  #   address1  = "9784 Adoree st"
  #   city = "Long Beach"
  #   state = "CA"
  #   patch user_path(@user), user: { address1:  address1,
  #                                   city: city,
  #                                   state: state, 
  #                                   zip_code:              "",
  #                                   phone: "" }
  #   assert_not flash.empty?
  #   assert_redirected_to address_user_path(@user)
  #   @user.reload
  #   assert_equal address1,  @user.address1
  #   assert_equal city, @user.city
  #   assert_equal state, @user.state
  # end
  
end