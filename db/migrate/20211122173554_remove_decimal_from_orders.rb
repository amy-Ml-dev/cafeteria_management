class RemoveDecimalFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :decimal, :string
  end
end
