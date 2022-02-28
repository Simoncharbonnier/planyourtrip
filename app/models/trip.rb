class Trip < ApplicationRecord
  has_many :subscriptions
  has_many :availabilities
  has_many :tasks
  has_many :messages
  has_many :placeProposals
end
