class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :start_at, presence: true
  validates :end_at, presence: true
end
