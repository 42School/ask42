class CreateRoomsUsers < ActiveRecord::Migration
  def change
    create_table :rooms_users do |t|
      t.integer :user_id
      t.integer :room_id
      t.boolean :editor

      t.timestamps null: false
    end
  end
end
