class RemoveDeletedIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :deleted_id
    add_column :users, :deleted_at, :datetime, null: true
  end
end
