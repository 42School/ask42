class RoomsController < ApplicationController
	def index
		@rooms = Room.all.order(:id)
		if user_signed_in?
			@user_questions = Question.where(user_id: current_user.id)
			@user_rooms = RoomsUser.where(user_id: current_user.id, editor: true).pluck(:room_id)
		end
	end

	def show
		redirect_to room_questions_path(params[:id])
	end

	def new
		redirect_to root_path unless user_signed_in? and current_user.admin?
		@room = Room.new
	end

	def create
		redirect_to root_path unless user_signed_in? and current_user.admin?
		@room = Room.new(params[:room].permit(:name))
		@room.save
		redirect_to rooms_path
	end

	def edit
		redirect_to root_path unless user_signed_in? and current_user.admin?
		@room = Room.find(params[:id])

		respond_to do |format|
			if @room.update(:name => params[:room][:name])
				format.js
			end
		end
	end

	def update
		redirect_to root_path unless user_signed_in? and current_user.admin?
		@room = Room.find(params[:id])

		@room.update_attributes(params[:room].permit(:name, rooms_users_attributes: [:user_id, :_destroy, :id, :editor]))
		redirect_to rooms_path
	end

	def destroy
		redirect_to rooms_path unless user_signed_in? and current_user.admin?
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to rooms_path
	end
end
