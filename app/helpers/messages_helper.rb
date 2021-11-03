module MessagesHelper
  require "uri"

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
      create_notification(user_id, nil, nil, @message.id, "message" )
    end
  end

  def text_url_to_link(text)
    URI.extract(text, ["http", "https"]).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
      text.gsub!(url, "#{sub_text}")
    end
    text
  end
end
