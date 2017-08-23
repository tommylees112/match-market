class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :odd
  validates :user_id, uniqueness: { scope: :odds_id }
end
