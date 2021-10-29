class CreateRecruits < ActiveRecord::Migration[5.2]
  def change
    create_table :recruits do |t|
      t.integer    :user_id,               null: false, default: ""
      t.integer    :play_form_id,          null: false, default: ""
      t.integer    :entry_condition_id,    null: false, default: ""
      t.string     :title,                 null: false, default: ""
      t.string     :image_id,              null: false, default: ""
      t.datetime   :hold_datetime,         null: false, default: ""
      t.integer    :capacity,              null: false, default: ""
      t.text       :explanation,           null: false, default: ""
      t.string     :discord_server_link,   null: false, default: ""
      t.integer    :recruit_status,        null: false, default: 1
      t.integer    :recruit_comments_count,null: false, default: 0
      t.integer    :reserves_count,        null: false, default: 0
      t.timestamps
    end
  end
end
