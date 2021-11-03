class ReservesController < ApplicationController
  before_action :set_recruit
  before_action :confirm_access_restrictions, only: [:confirm, :complete]
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
    @reserves = @recruit.reserves
    status = params[:status]
    case status
      when "approve_reserve" then
        @reserve.update_attributes(reserve_status: "approve_reserve")
        @active = "green_active"
      when "reject_reserve" then
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
      server_link = "サーバー招待を送信します\r\nご入室ください\r\n#{text_url_to_link(reserve.recruit.discord_server_link).html_safe}"
      room_create_search(user.id, server_link, "broadcast")
    end
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:recruit_id])
  end

  def confirm_access_restrictions
    if @recruit.recruit_status == "end_recruit"
      redirect_to reserve_list_recruit_path(@recruit.id)
    end
  end
end
