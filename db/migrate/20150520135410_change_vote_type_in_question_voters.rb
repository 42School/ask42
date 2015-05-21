class ChangeVoteTypeInQuestionVoters < ActiveRecord::Migration
  def change
    remove_column :question_voters, :vote
    add_column :question_voters, :vote, :integer
  end
end
