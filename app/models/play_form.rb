class PlayForm < ApplicationRecord
  has_many :recruit, dependent: :destroy
end
