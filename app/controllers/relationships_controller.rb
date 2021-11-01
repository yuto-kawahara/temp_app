class RelationshipsController < ApplicationController
  before_action :set_recruit

  def create
    current_user.follow(@user)
  end

  def destroy
    current_user.unfollow(@user)
  end

  def set_recruit
    @user = User.find(params[:user_nickname])
  end
end
