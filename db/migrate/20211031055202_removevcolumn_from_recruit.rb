class RemovevcolumnFromRecruit < ActiveRecord::Migration[5.2]
  def change
    remove_column :recruits, :play_form_id
    remove_column :recruits, :entry_condition_id
  end
end
