class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :odds
  validates :user_id, uniqueness: { scope: :odds_id,
    message: "one user places a bet on one set of odds" }
  end
end
