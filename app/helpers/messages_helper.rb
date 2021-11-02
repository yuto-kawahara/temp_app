module MessagesHelper

  def room_create_search(user_id, message, send_method)
    rooms = current_user.user_rooms.pluck(:room_id)
    @user_rooms = UserRoom.find_by(user_id: user_id, room_id: rooms)

    if @user_rooms.present?
      @room = @user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: user_id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = current_user.messages.new(room_id: @room.id, content: message)
    if send_method == "broadcast"
      @message.save
    end
  end
end
