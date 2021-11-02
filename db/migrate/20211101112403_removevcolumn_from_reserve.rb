class RemovevcolumnFromReserve < ActiveRecord::Migration[5.2]
  def change
     remove_column :reserves, :reserve_status, :text
    add_column :reserves, :reserve_status, :integer
  end
end
