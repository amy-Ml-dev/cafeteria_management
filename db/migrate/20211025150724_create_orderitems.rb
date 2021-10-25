class CreateOrderitems < ActiveRecord::Migration[6.1]
  def change
    create_table :orderitems do |t|
      t.bigint :order_id
      t.bigint :menu_item_id
      t.string :menu_item_name
      t.decimal :menu_item_price

      t.timestamps
    end
  end
end
