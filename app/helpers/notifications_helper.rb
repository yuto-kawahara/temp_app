module NotificationsHelper
  def create_notification(user_id, recruit_id, recruit_comment_id, message_id, action)
    unless current_user.id == user_id
      notification = current_user.active_notifications.new(
        recruit_id: recruit_id,
        recruit_comment_id: recruit_comment_id,
        message_id: message_id,
        visited_id: user_id,
        action: action
      )
      if notification.valid?
        notification.save
      end
    end
  end

  def notification_form(notification)
    @visitor = notification.visitor
    @recruit = notification.recruit
    @comment = nil
    case notification.action
      when "reserve" then
        user = tag.a(notification.visitor.nickname, href:profile_user_path(@visitor), style:"font-weight: bold;")
        content = tag.a(@recruit.title, href:recruit_path(@recruit), style:"font-weight: bold;")
        user + "さんが" + content + "に予約しました"
      when "cancel" then
        user = tag.a(notification.visitor.nickname, href:profile_user_path(@visitor), style:"font-weight: bold;")
        content = tag.a(@recruit.title, href:recruit_path(@recruit), style:"font-weight: bold;")
        user + "さんが" + content + "にキャンセルしました"
      when "message" then
        @comment = Message.find_by(id: notification.message_id)&.content
        user = tag.a(notification.visitor.nickname, href:profile_user_path(@visitor), style:"font-weight: bold;")
        content = tag.a("DM", href:message_path(notification.message.room), style:"font-weight: bold;")
        user + "さんとの" + content + "にメッセージがありました"
    end

  end

end
