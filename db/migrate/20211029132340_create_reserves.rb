class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.integer    :user_id,               null: false, default: ""
      t.integer    :recruit_id,            null: false, default: ""
      t.text       :reserve_status,        null: false, default: 0
      t.timestamps
    end
  end
end
