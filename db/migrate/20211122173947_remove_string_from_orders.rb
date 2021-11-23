class RemoveStringFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :string, :string
  end
end
