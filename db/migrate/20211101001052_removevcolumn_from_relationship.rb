class RemovevcolumnFromRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :follower_id
    add_column :relationships, :following_id, :integer
  end
end
