class RecruitsController < ApplicationController
  before_action :ensure_correct_recruit, except: [:new, :index, :create, :schedule]

  def new
    @recruit = Recruit.new
  end

  def index
    @recruits = Recruit.includes(:user)
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
    @recruit = Recruit.new(recruit_params)
    if @recruit.save
      redirect_to recruit_path(@recruit)
    else
      render :new
    end
  end

  def destroy
    @recruit.destroy
    redirect_to home_path
  end

  def schedule
  end

  def confirm
  end

  def complete
  end

  private

  def recruit_params
    params.require(:recruit).permit(
      :title,
      :hold_datetime,
      :capacity,
      :explanation,
      :discord_server_link
    )
  end

  def ensure_correct_recruit
    @recruit = Recruit.find_by(title: params[:id])
  end
end
