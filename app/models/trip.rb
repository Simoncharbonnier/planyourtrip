class Trip < ApplicationRecord
  has_many :subscriptions
  has_many :availabilities
  has_many :tasks
  has_many :messages
  has_many :place_proposals

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :duration, presence: true
end
