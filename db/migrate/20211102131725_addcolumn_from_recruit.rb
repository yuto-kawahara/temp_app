class AddcolumnFromRecruit < ActiveRecord::Migration[5.2]
  def change
    add_column :recruits, :start_time, :datetime
  end
end
