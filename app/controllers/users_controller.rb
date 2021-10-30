class UsersController < ApplicationController
  before_action :ensure_correct_user, except: [:index]

  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
    current_user.destroy
    reset_session
    redirect_to root_path, notice: "退会しました。"
  end

  def followings
    @users = @user.following_user
  end

  def followers
    @users = @user.follower_user
  end

  def schedule
    @recruits = current_user.recruits
    @reserves = current_user.reserves
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :icon_image)
  end

  def ensure_correct_user
    @user = User.find_by(nickname: params[:id])
  end
end
