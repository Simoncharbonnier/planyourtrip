class PlaceProposal < ApplicationRecord
  belongs_to :trip
  belongs_to :place
end
