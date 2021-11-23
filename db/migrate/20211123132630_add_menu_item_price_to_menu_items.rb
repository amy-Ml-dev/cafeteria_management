class AddMenuItemPriceToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :menu_item_price, :decimal
  end
end
