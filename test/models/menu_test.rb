require 'test_helper'

class MenuTest < ActiveSupport::TestCase

  def setup
    @user = users(:example)
    @menu = menus(:pizzeria)
    @menu_item = menu_items(:pizza)
  end

  test "should be valid" do
    assert @menu.valid?
  end

  test "user id should be present" do
    @menu.user_id = nil
    assert_not @menu.valid?
  end

  test "description should be 140 characters or less" do
    @menu.description = "a" * 141
    assert_not @menu.valid?
  end

  test "menu items should be also be destroyed" do
    @menu.save
    assert_difference 'MenuItem.count', -1 do
      @menu.destroy
    end
  end


end
