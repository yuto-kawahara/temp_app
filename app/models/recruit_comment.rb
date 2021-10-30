class RecruitComment < ApplicationRecord
  belongs_to :user
  belongs_to :recruit
  has_many   :notifications, dependent: :destroy
  counter_culture :recruit
  validates :comment, presence: true
end
