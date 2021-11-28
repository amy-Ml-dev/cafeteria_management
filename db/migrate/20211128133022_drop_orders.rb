class DropOrders < ActiveRecord::Migration[6.1]
  def change
    drop_table :orders do |t|
      t.bigint "user_id"
      t.date "date"
      t.datetime "delivered_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "status"
      t.string "total_price"
      t.datetime "ordered_at"
    end
  end
end
