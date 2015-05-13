class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :user
      t.string :question
      t.integer :vote_count

      t.timestamps null: false
    end
  end
end
