class Recruit < ApplicationRecord
  belongs_to :user
  belongs_to :play_form
  belongs_to :entry_condition
  has_many   :reserves,         dependent: :destroy
  has_many   :recruit_comments, dependent: :destroy
  has_many   :notifications,    dependent: :destroy

  attachment :image
  validates :title,               presence: true
  validates :hold_datetime,       presence: true
  validates :capacity,            presence: true
  validates :explanation,         presence: true
  validates :discord_server_link, presence: true

  enum recruit_status:{
    not_recruit: 0,     #未募集
    now_recruit: 1,    #募集中
    few_recruit: 2,    #残り僅か
    end_recruit: 3     #募集終了
  }
end
