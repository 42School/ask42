class AddRoomIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :room_id, :integer
  end
end
