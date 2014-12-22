require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase

  def setup
    @user = users(:example)
    @menu = menus(:pizzeria)
    @menu_item = menu_items(:pizza)
  end

  test "Should be valid" do
    assert @menu_item.valid?
  end

  test "menu id should be present" do
    @menu_item.menu_id = nil
    assert_not @menu_item.valid?
  end

  test "price must be a number" do
    @menu_item.price = "abc"
    assert_not @menu_item.valid?
  end

end
