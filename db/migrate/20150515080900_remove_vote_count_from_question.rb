class RemoveVoteCountFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :vote_count
  end
end
