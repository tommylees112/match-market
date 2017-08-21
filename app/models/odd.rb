class Odd < ApplicationRecord
  belongs_to :match
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :match, presence: true
  validates :user, presence: true
  validates :odds, presence: true, numericality: true
  validates :outcome, presence: true, inclusion: { in: ["home", "away", "draw"] }
end
