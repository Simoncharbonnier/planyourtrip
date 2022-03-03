class TripAvailability < ApplicationRecord
  belongs_to :trip
  has_many :availabilities
end
