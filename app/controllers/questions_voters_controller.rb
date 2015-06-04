class QuestionsVotersController < ApplicationController
	def index
			@votes = QuestionVoter.where(question_id: params[:question_id])
	end

	def create
		if params[:vote] == "upvote"
				vote = 1
		elsif params[:vote] == "downvote"
				vote = -1
		end
		if user_signed_in?
			if QuestionVoter.where(user_id: current_user.id, question_id: params[:question_id]).first
				QuestionVoter.where(user_id: current_user.id, question_id: params[:question_id]).update_all(vote: vote)
			else
				QuestionVoter.create(user_id: current_user.id, question_id: params[:question_id], vote: vote)
			end
			question = Question.find(params[:question_id])
			if !RoomsUser.where(:user_id => current_user.id, :room_id => question.room_id).first
				RoomsUser.create(:user_id => current_user.id, :room_id => question.room_id)
			end
		end
		redirect_to :back
	end
end
