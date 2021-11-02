class Recruit < ApplicationRecord
  scope :following_user_recruit, -> (user) { where(user_id: [user.id, user.following_user] ) }
  scope :status, -> (status)  { where(recruit_status: status ) }
  scope :sorted, -> { order(created_at: :desc ) }

  belongs_to :user
  has_many   :recruit_play_forms,       dependent: :destroy
  has_many   :play_forms,               through:   :recruit_play_forms
  has_many   :recruit_entry_conditions, dependent: :destroy
  has_many   :entry_conditions,         through:   :recruit_entry_conditions
  has_many   :reserves,                 dependent: :destroy
  has_many   :recruit_comments,         dependent: :destroy
  has_many   :notifications,            dependent: :destroy

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

  def reserve_exist?(user)
    reserves.where(user_id: user.id).exists?
  end

end
