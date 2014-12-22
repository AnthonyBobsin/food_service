class ChangePriceTypeInMenuItems < ActiveRecord::Migration
  def change
    change_column :menu_items, :price, :text
  end
end
