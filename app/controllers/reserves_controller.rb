class ReservesController < ApplicationController
  before_action :set_recruit
  include MessagesHelper
  include NotificationsHelper

  def create
    @reserve = @recruit.reserves.create(user_id: current_user.id)
    @reserve.update_attributes(reserve_status: "wait_reserve")
    create_notification(@recruit.user.id, @recruit.id, nil, nil, "reserve")
  end

  def destroy
    reserve = @recruit.reserves.find_by(user_id: current_user.id)
    reserve.destroy
    create_notification(@recruit.user.id, @recruit.id, nil, nil, "cancel")
  end

  def update
    @reserve = Reserve.find(params[:id])
    @reserves = Reserve.includes(:recruit, :user)
    status = params[:status]
    if status == "approve_reserve"
      @reserve.update_attributes(reserve_status: "approve_reserve")
      @active = "green_active"
    else
      @reserve.update_attributes(reserve_status: "reject_reserve")
      @active = "red_active"
    end
  end

  def confirm
    @reserves = Reserve.where(recruit_id: @recruit.id, reserve_status: "approve_reserve")
  end

  def complete
    @reserves = Reserve.where(recruit_id: @recruit.id, reserve_status: "approve_reserve")
    @recruit.update_attributes(recruit_status: "end_recruit")
    @reserves.each do |reserve|
      user = reserve.user
      server_link = reserve.recruit.discord_server_link
      room_create_search(user, server_link, "broadcast")
    end
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:recruit_id])
  end

end
