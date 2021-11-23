class RemovePriceFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :price, :decimal
  end
end
