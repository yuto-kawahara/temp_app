class RecruitCommentsController < ApplicationController
  before_action :set_recruit

  def create
    @recruit_comment = current_user.recruit_comments.new(comment_params)
    @recruit_comment.recruit_id = @recruit.id
    @recruit_comment.save
  end

  def destroy
    recruit_comment = @recruit.recruit_comments.find(params[:id])
    recruit_comment.destroy
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:recruit_id])
  end

  def comment_params
    params.require(:recruit_comment).permit(:comment)
  end
end
