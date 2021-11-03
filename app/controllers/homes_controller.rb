class HomesController < ApplicationController
  def top
  end

  def home
    @recruits = Recruit.following_user_recruit(current_user).sorted
  end

  def setting
  end

  def help
  end

  def contact
  end

end
