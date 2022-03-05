class Trip < ApplicationRecord
  has_many :subscriptions
  has_many :trip_availabilities
  has_many :availabilities, through: :trip_availabilities

  has_many :tasks
  has_many :messages
  has_many :place_proposals
  has_many :votes, through: :place_proposals

  belongs_to :place_proposal, optional: true
  belongs_to :trip_availability, optional: true
  belongs_to :user

  validates :name, presence: true
  validates :time_span, presence: true
end
