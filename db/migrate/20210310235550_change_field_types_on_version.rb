class ChangeFieldTypesOnVersion < ActiveRecord::Migration[6.1]
  def change
    remove_column :versions, :item_id, :text
    add_column :versions, :item_id, :text
    add_column :versions, :user_ip, :text
    add_column :versions, :user_agent, :text
  end
end
