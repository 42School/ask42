class QuestionsVotersController < ApplicationController
  def create
    if params[:vote] == "upvote"
      vote = 1
    elsif params[:vote] == "downvote"
      vote = -1
    end
    if user_signed_in?
      QuestionVoter.create(:user_id => current_user.id, :question_id => params[:question_id], :vote => vote)
    end
    render :nothing => true
  end
end
