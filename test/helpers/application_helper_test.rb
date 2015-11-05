require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title(""),         "Wunder"
    assert_equal full_title("About"), "Wunder | About"
    assert_equal full_title("Help"), "Wunder | Help"
  end
end