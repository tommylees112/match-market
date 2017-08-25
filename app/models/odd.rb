class Odd < ApplicationRecord
  VALUES = ["Home", "Away", "Draw"]
  belongs_to :match
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :match, presence: true
  validates :user, presence: true
  validates :odds, presence: true, numericality: true
  validates :outcome, presence: true, inclusion: { in: VALUES }

  def won?
    if (self.match.status == 'FINISHED')
    outcome_true = ""

    if self.match.goals_home_team > self.match.goals_away_team
      outcome_true = "Home"
     elsif self.match.goals_home_team < self.match.goals_away_team
       outcome_true = "Away"
     elsif self.match.goals_home_team == self.match.goals_away_team
       outcome_true = "Draw"
     end

    if (self.outcome == outcome_true)
      bet_outcome = "lose"
      self.update(won: false)
    else
      bet_outcome = "win"
      self.update(won: true)
    end

   else
     bet_outcome = "pending"
   end

   return bet_outcome
  end

  def number_of_current_bookings
    self.bookings.count
  end

  def current_exposure
    exposure = 0
    # GET THE USER CREATED ODDS AND THERE ASSOCIATED BOOKINGS
      self.bookings.each do |booking|
        exposure += (booking.stake * odd.odds) - booking.stake
      end
    return exposure
  end

  def possible_winnings
    result = 0
      self.bookings.each do |booking|
        result += booking.stake
      end
    return result
  end
end
