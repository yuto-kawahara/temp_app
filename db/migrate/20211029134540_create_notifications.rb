class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id,               null: false, default: ""
      t.integer :visited_id,               null: false, default: ""
      t.integer :recruit_id
      t.integer :recruit_comment_id
      t.integer :message_id
      t.string  :action,                   null: false, default: ""
      t.boolean :checked,                  null: false, default: false
      t.timestamps
    end
  end
end
