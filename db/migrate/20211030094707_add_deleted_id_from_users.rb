class AddDeletedIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted_id, :datetime, null: true
  end
end
