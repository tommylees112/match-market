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
USER = User.find(4) #[tommy, hamish, adrian]
OUTCOME = ["Home", "Away", "Draw"]

Match.all.each do |match|
  OUTCOME.each do |outcome|
    3.times do
      odd = Odd.new(match: match)
      odd.outcome = outcome
      odds_number = rand(1.1..2.0).round(2)
      odd.odds = odds_number
      odd.user = USER
      odd.save!
    end
  end
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

