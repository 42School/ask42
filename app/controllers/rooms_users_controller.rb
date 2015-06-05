class RoomsUsersController < ApplicationController
	def index
		redirect_to root_path unless user_signed_in? and (current_user.admin? or current_user.editor?)

		@room = Room.find(params[:room_id])

		@rooms_users = RoomsUser.where(:room_id => @room.id)

		@users_hash = {}
		@subscriptable_users = User.where.not(:id => @room.rooms_users.map {|x| x.user.id})
		@subscriptable_users.each {|user| @users_hash[user.login] = user.id}
	end

	def destroy
		@rooms_user = RoomsUser.find(params[:id])
		@rooms_user.delete
	end
end
