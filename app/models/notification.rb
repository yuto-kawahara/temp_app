class Notification < ApplicationRecord
  scope :not_current_user, -> (user_id) { where.not(visitor_id: user_id ) }
  scope :unread,           -> { where(checked: false )    }

  belongs_to :recruit,         optional: true
  belongs_to :recruit_comment, optional: true
  belongs_to :message,         optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
