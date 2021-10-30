class Reserve < ApplicationRecord
  scope :status, -> (status)  { where(reserve_status: status ) }

  belongs_to :user
  belongs_to :recruit
  counter_culture :recruit

  enum reserve_status:{
    not_reserve:     0,    #未予約
    wait_reserve:    1,    #返信待ち
    approve_reserve: 2,    #承認
    reject_reserve:  3     #拒否
  }
end
