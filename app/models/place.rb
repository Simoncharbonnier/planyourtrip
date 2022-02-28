class Place < ApplicationRecord
  has_many :place_proposals

  validates :city, presence: true, uniqueness: true
end
