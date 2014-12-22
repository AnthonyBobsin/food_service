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


end
