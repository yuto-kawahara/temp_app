class RecruitCommentsController < ApplicationController
  def create
  end

  def destroy
  end

  private

  def comment_params
    params.require(:recruit_comment).permit(:comment)
  end
end
