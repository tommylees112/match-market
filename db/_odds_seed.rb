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

# CONSOLE

Match.all.each do |match|
  OUTCOME.each do |outcome|
    5.times do
      odd = Odd.new(match: match)
      odd.outcome = outcome
      odds_number = rand(1.1..2.0).round(2)
      odd.odds = odds_number
      odd.user = User.find(1)
      odd.save
    end
  end
end
