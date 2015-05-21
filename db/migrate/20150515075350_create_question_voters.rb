class CreateQuestionVoters < ActiveRecord::Migration
  def change
    create_table :question_voters do |t|
      t.integer :question_id
      t.integer :user_id
      t.boolean :vote

      t.timestamps null: false
    end
  end
end
