class EntryCondition < ApplicationRecord
  has_many :recruit, dependent: :destroy
end
