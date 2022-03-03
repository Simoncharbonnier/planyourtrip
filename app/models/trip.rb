class Trip < ApplicationRecord
  has_many :subscriptions
  has_many :trip_availabilities
  has_many :tasks
  has_many :messages
  has_many :place_proposals

  validates :name, presence: true
end
