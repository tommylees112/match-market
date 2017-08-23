namespace :odds do
  task seed: :environment do
    OUTCOME = ["Home", "Away", "Draw"]

    def generate_odd_params(odd)
      odd.user = User.find(1)
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
