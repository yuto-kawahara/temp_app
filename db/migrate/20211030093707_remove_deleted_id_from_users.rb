class RemoveDeletedIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :deleted_id
  end
end
