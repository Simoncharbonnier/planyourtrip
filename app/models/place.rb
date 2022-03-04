class Place < ApplicationRecord
  has_many :place_proposals
  has_one_attached :photo

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  validates :city, presence: true, uniqueness: true
end
