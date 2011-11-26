class RemoveColumnOrderUsers < ActiveRecord::Migration
  def change
    remove_column :orders, :users_id
  end
end
