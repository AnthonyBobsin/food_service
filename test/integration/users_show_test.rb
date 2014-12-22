require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example)
    @menu = menus(:pizzeria)
    @menu_item = menu_items(:pizza)
  end

  test "All variables should be valid" do
    assert @user.valid?
    assert @menu.valid?
    assert @menu_item.valid?
  end

  test "menu and menu items should be present" do
    log_in_as(@user)
    assert is_logged_in?
    follow_redirect!
    assert_template 'users/show'
    assert_select 'h3'
    assert_select 'ul>li'
  end


end
