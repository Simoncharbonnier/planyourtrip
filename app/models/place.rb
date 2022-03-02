class Place < ApplicationRecord
  has_many :place_proposals

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  validates :city, presence: true, uniqueness: true
end
