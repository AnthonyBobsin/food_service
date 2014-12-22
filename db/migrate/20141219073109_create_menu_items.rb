class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.text :item
      t.float :price

      t.timestamps null: false
    end
  end
end
