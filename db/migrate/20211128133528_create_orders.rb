class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.date :date
      t.datetime :delivered_at
      t.string :status
      t.string :total_price
      t.datetime :ordered_at

      t.timestamps
    end
  end
end
