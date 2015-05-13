class AddAnsweredToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :answered, :boolean
  end
end
