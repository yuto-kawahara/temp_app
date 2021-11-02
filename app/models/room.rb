class Room < ApplicationRecord
  has_many :messages,   dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms
end