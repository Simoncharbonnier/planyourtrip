class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :trip_availability

  validates :trip_availability, presence: true
end
