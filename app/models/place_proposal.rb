class PlaceProposal < ApplicationRecord
  belongs_to :trip
  belongs_to :place
  belongs_to :user

  has_many :votes
end
