class MessagesController < ApplicationController
  def index
    @rooms = current_user.rooms
    @user_rooms = UserRoom.where(room_id: @rooms).where.not(user_id: current_user.id)
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
  end

  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    @user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if @user_rooms.present?
      @room = @user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end
