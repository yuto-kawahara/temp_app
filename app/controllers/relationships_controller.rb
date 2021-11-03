class RelationshipsController < ApplicationController
  before_action :set_recruit
  include NotificationsHelper

  def create
    current_user.follow(@user)
    create_notification(@user.id, nil, nil, nil, "follow")
  end

  def destroy
    current_user.unfollow(@user)
  end

  def set_recruit
    @user = User.find(params[:user_nickname])
  end
end
