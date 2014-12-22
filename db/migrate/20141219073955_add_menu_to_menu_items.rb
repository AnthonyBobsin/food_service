class AddMenuToMenuItems < ActiveRecord::Migration
  def change
    add_reference :menu_items, :menu, index: true
    add_foreign_key :menu_items, :menus
  end
end
