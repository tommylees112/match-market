class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owned_odds, through: :bookings, source: :odds
  has_many :odds
  has_many :bookings
  has_many :comments
  after_create :send_welcome_email

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def user_name
    user_name = self.email.match(/^([^@]*)@/)[1]
    return user_name
  end

  ## METHODS FOR BOUGHT ODDS (that the user has bet on)

  def calculate_winnings
    result = 0
    self.bookings.each do |booking|
      if booking.match.status == "FINISHED"
        if booking.won
          result += booking.stake * booking.odd.odds
        else
          result -= booking.stake
        end
      end
    end
    return result.round(2)
  end

  def calculate_outstanding_bets
    result = 0
    self.bookings.each do |booking|
      if booking.match.status == "TIMED"
        result += booking.stake
      end
    end
    return result.round(2)
  end

  ## METHODS FOR CREATED ODDS (that the user has created)

  def calculate_possible_return
    result = 0
    self.odds.each do |odd|
      odd.bookings.each do |booking|
        result += booking.stake
      end
    end
    return result
  end

  def calculate_total_possible_exposure
    exposure = 0
    # GET THE USER CREATED ODDS AND THERE ASSOCIATED BOOKINGS
    self.odds.each do |odd|
      odd.bookings.each do |booking|
        exposure += (booking.stake * odd.odds) * max_people
      end
    end
    return exposure
  end

  def calculate_current_exposure
    exposure = 0
    # GET THE USER CREATED ODDS AND THERE ASSOCIATED BOOKINGS
    self.odds.each do |odd|
      odd.bookings.each do |booking|
        exposure += (booking.stake * odd.odds) - booking.stake
      end
    end
    return exposure
  end

  def calculate_created_winnings
    result = 0
    self.odds.each do |odd|
      if odd.match.status == "FINISHED"
        # check the match outcome
        true_outcome = created_bet_outcome(odd)
        # compare against our 'wagered' outcome
        if true_outcome == odd.outcome
          odd.bookings.each do |booking|
            result -= booking.stake * odd.odds
          end
        else
          odd.bookings.each do |booking|
            result += booking.stake
          end
        end
      end
    end
    return result
  end

  def calculate_total_profit
    profit = 0
    profit += calculate_winnings
    profit += calculate_created_winnings
    return profit
  end

  private

  def created_bet_outcome(odd)
    outcome_true = ""
    if odd.match.goals_home_team > odd.match.goals_away_team
      outcome_true = "Home"
     elsif odd.match.goals_home_team < odd.match.goals_away_team
       outcome_true = "Away"
     elsif odd.match.goals_home_team == odd.match.goals_away_team
       outcome_true = "Draw"
     end
     return outcome_true
   end


  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end


















