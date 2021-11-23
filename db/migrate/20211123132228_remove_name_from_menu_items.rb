class RemoveNameFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :name, :string
  end
end
