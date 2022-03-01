class Vote < ApplicationRecord
  belongs_to :place_proposal
  belongs_to :user
end
