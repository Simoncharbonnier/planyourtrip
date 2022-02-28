class Message < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :content, presence: true, length: { maximum: 500 }
end
