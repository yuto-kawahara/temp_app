class MessagesController < ApplicationController
  include MessagesHelper
  include NotificationsHelper

  def index
    @rooms = current_user.rooms
    @user_rooms = UserRoom.where(room_id: @rooms).where.not(user_id: current_user.id)
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
    users = @message.room.users
    user_id = users.where.not(id: current_user.id).first.id
    create_notification(user_id, nil, nil, @message.id, "message")
  end

  def show
    @room = Room.find(params[:id])
    users = @room.users
    @user = users.where.not(id: current_user.id).first
    room_create_search(@user.id, "", "one")
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end
