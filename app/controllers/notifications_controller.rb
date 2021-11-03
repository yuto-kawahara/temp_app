class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.sorted
    @notifications.unread.each do |notification|
      notification.update_attribute(:checked, true)
    end
  end
end
