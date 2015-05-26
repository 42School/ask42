class QuestionsController < ApplicationController
  def index
    @questions = Question.joins(:question_voters).group("questions.id").where(:room_id => params[:room_id]).order("sum(question_voters.vote)").reverse
  end

  def new
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @questions = Room.find(params[:room_id]).questions.new()
  end

  def create
    if user_signed_in?
      @question = Question.new(question_params)
      @question.user_id = current_user.id
      @question.save

      if !RoomsUser.where(:user_id => current_user.id).first
        @rooms_user = RoomsUser.create(:user_id => current_user.id, :room_id => params[:question][:room_id])
      end
    end

    redirect_to room_questions_path(:room_id => params[:question][:room_id])
  end

  def update
    @question = Question.find(params[:id])
    if user_signed_in?
      if @question.question_voters.create(params[:question][:question_voters].permit(:id, :user_id))
        render :nothing => true
      end
    end
  end

  private
    def question_params
      params.require(:question).permit(:room_id, :question)
    end
end
