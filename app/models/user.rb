class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :subscriptions
  has_many :availabilities
  has_many :tasks
  has_many :messages
  has_many :trips, through: :subscriptions
end
