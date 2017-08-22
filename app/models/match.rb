class Match < ApplicationRecord
  has_many :odds
  has_many :bookings, through: :odds
  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :match_date, presence: true
  validates :gameweek, presence: true, numericality: true
  validates :league, presence: true
end
