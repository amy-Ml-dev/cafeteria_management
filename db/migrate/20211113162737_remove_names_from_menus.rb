class RemoveNamesFromMenus < ActiveRecord::Migration[6.1]
  def change
    remove_column :menus, :names, :text
  end
end
