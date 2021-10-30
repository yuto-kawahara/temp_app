class HomesController < ApplicationController
  def top
  end

  def home
    @users = current_user.following_user.includes(:recruits)
  end

  def setting
  end

  def help
  end

  def contact
  end

end
