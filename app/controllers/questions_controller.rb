class QuestionsController < ApplicationController
  def index
    @questions_answered = Question.joins("LEFT JOIN question_voters ON question_voters.question_id = questions.id").group("questions.id").where(:room_id => params[:room_id], :answered => true).order("sum(question_voters.vote)").reverse
    @questions = Question.joins("LEFT JOIN question_voters ON question_voters.question_id = questions.id").group("questions.id").where(:room_id => params[:room_id], :answered => nil).order("sum(question_voters.vote)").reverse
  end

  def new
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @room = Room.find(params[:room_id])
    @questions = @room.questions.new()
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
      if @question.update_attributes(params[:question].permit(:answered))
        render :nothing => true
      end
    end
  end

  def destroy
    redirect_to :back unless user_signed_in? and current_user.admin?
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :back
  end

  def answer

  end

  private
    def question_params
      params.require(:question).permit(:room_id, :question)
    end
end
