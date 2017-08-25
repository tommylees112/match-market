OUTCOME = ["Home", "Away", "Draw"]

Match.first(5).each do |match|
  OUTCOME.each do |outcome|
    5.times do
      odd = Odd.new(match: match)
      odd.outcome = outcome
      generate_odd_params(odd)
    end
  end
end

def generate_odd_params(odd)
  odd.user = User.find(1)
  odds_number = rand(1.1..2.0).round(2)
  odd.odds = odds_number
  odd.save
end

###### CONSOLE METHOD
tommy = User.find(1) #_by_email("thomas.lees@chch.ox.ac.uk")
hamish = User.find(3) #_by_email("hachall@hotmail.com")
adrian = User.find(2) #_by_email("walkerrrrrrr@gmail.com")

user_1 = User.find(21) #[tommy, hamish, adrian]
user_2 = User.find(19) #[tommy, hamish, adrian]
user_3 = User.find(24) #[tommy, hamish, adrian]
user_4 = User.find(25) #[tommy, hamish, adrian]
arthur = User.find(26)
hamish = User.find(22)
adrian = User.find()

USER = [arthur, hamish]
OUTCOME = ["Home", "Away", "Draw"]

Match.all.each do |match|
  OUTCOME.each do |outcome|
    2.times do
      odd = Odd.new(match: match)
      odd.outcome = outcome
      odds_number = rand(1.1..2.0).round(2)
      odd.odds = odds_number
      odd.user = USER.sample
      odd.max_people = rand(1..20)
      odd.save!
    end
  end
end

USERS = User.all
USERS.sample
ODDS = Odd.all


USER = [user_1, user_2, user_3, user_4]
tommy = User.find(20)
tommy_odd = tommy.odds.first

3.times do
  booking = Booking.new
  booking.user = User.all.sample
  booking.odd = tommy_odd
  booking.stake = rand(1..20)
end

ODDS.each do |odd|

end

## RAKFILE $ rails odds:seed
namespace :odds do
  task seed: :environment do
    OUTCOME = ["Home", "Away", "Draw"]
    tommy = User.find(1) #_by_email("thomas.lees@chch.ox.ac.uk")
    hamish = User.find(3) #_by_email("hachall@hotmail.com")
    adrian = User.find(2) #_by_email("walkerrrrrrr@gmail.com")
    USER = [tommy, hamish, adrian]

    def generate_odd_params(odd)
      odd.user = USER.sample
      odds_number = rand(1.1..2.0).round(2)
      odd.odds = odds_number
      odd.save!
    end

    Match.all.each do |match|
      OUTCOME.each do |outcome|
        3.times do
          odd = Odd.new(match: match)
          odd.outcome = outcome
          generate_odd_params(odd)
        end
      end
    end

  end
end

