class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :odd
  has_one :match, through: :odd
  validates :user_id, uniqueness: { scope: :odd_id }
end
