class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :availability, presence: true
end
