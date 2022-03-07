class Task < ApplicationRecord
  has_many :user_tasks
  belongs_to :trip

  validates :name, presence: true

  after_create :create_associated_user_tasks

  def create_associated_user_tasks
    trip.subscriptions.each do |sub|
      UserTask.create(user: sub.user, task: self)
    end
  end
end
