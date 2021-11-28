class DropOrderItems < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_items do |t|
      t.bigint "order_id"
      t.bigint "menu_item_id"
      t.string "menu_item_name"
      t.string "menu_item_price"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "quantity"
      t.decimal "price"
    end
  end
end
