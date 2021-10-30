class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :recruit
  counter_culture :recruit
end
