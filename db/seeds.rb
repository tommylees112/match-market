
require 'json'
require 'open-uri'

Match.destroy_all

premier_fixtures_url = 'http://api.football-data.org/v1/competitions/445/fixtures'
premier_fixtures_serialized = open(premier_fixtures_url).read
premier_fixtures = JSON.parse(premier_fixtures_serialized)

premier_fixtures["fixtures"].each do |fixture|
  home_team = fixture["homeTeamName"]
  goals_home_team = fixture["result"]["goalsHomeTeam"]
  away_team = fixture["awayTeamName"]
  goals_away_team = fixture["result"]["goalsAwayTeam"]
  matchday = fixture["matchday"]
  date = fixture["date"]
  status = fixture["status"]
  Match.create!(home_team: home_team, away_team: away_team, goals_home_team: goals_home_team, goals_away_team: goals_away_team, gameweek: matchday, match_date: date, status: status, league: "Premier League 2017/18")
end

bundesliga_fixtures_url = 'http://api.football-data.org/v1/competitions/452/fixtures'
bundesliga_fixtures_serialized = open(bundesliga_fixtures_url).read
bundesliga_fixtures = JSON.parse(bundesliga_fixtures_serialized)

bundesliga_fixtures["fixtures"].each do |fixture|
  home_team = fixture["homeTeamName"]
  goals_home_team = fixture["result"]["goalsHomeTeam"]
  away_team = fixture["awayTeamName"]
  goals_away_team = fixture["result"]["goalsAwayTeam"]
  matchday = fixture["matchday"]
  date = fixture["date"]
  status = fixture["status"]
  Match.create!(home_team: home_team, away_team: away_team, goals_home_team: goals_home_team, goals_away_team: goals_away_team, gameweek: matchday, match_date: date, status: status, league: "Bundesliga 2017/18")
end

ligue1_fixtures_url = 'http://api.football-data.org/v1/competitions/450/fixtures'
ligue1_fixtures_serialized = open(ligue1_fixtures_url).read
ligue1_fixtures = JSON.parse(ligue1_fixtures_serialized)

ligue1_fixtures["fixtures"].each do |fixture|
  home_team = fixture["homeTeamName"]
  goals_home_team = fixture["result"]["goalsHomeTeam"]
  away_team = fixture["awayTeamName"]
  goals_away_team = fixture["result"]["goalsAwayTeam"]
  matchday = fixture["matchday"]
  date = fixture["date"]
  status = fixture["status"]
  Match.create!(home_team: home_team, away_team: away_team, goals_home_team: goals_home_team, goals_away_team: goals_away_team, gameweek: matchday, match_date: date, status: status, league: "Ligue 1 2017/18")
end

laLiga_fixtures_url = 'http://api.football-data.org/v1/competitions/455/fixtures'
laLiga_fixtures_serialized = open(laLiga_fixtures_url).read
laLiga_fixtures = JSON.parse(laLiga_fixtures_serialized)

laLiga_fixtures["fixtures"].each do |fixture|
  home_team = fixture["homeTeamName"]
  goals_home_team = fixture["result"]["goalsHomeTeam"]
  away_team = fixture["awayTeamName"]
  goals_away_team = fixture["result"]["goalsAwayTeam"]
  matchday = fixture["matchday"]
  date = fixture["date"]
  status = fixture["status"]
  Match.create!(home_team: home_team, away_team: away_team, goals_home_team: goals_home_team, goals_away_team: goals_away_team, gameweek: matchday, match_date: date, status: status, league: "La Liga 2017/18")
end

serieA_fixtures_url = 'http://api.football-data.org/v1/competitions/456/fixtures'
serieA_fixtures_serialized = open(serieA_fixtures_url).read
serieA_fixtures = JSON.parse(serieA_fixtures_serialized)

serieA_fixtures["fixtures"].each do |fixture|
  home_team = fixture["homeTeamName"]
  goals_home_team = fixture["result"]["goalsHomeTeam"]
  away_team = fixture["awayTeamName"]
  goals_away_team = fixture["result"]["goalsAwayTeam"]
  matchday = fixture["matchday"]
  date = fixture["date"]
  status = fixture["status"]
  Match.create!(home_team: home_team, away_team: away_team, goals_home_team: goals_home_team, goals_away_team: goals_away_team, gameweek: matchday, match_date: date, status: status, league: "Serie A 2017/18")
end

premier_teams_url = 'http://api.football-data.org/v1/competitions/445/teams'
premier_teams_serialized = open(premier_teams_url).read
premier_teams = JSON.parse(premier_teams_serialized)

bundesliga_teams_url = 'http://api.football-data.org/v1/competitions/452/teams'
bundesliga_teams_serialized = open(bundesliga_teams_url).read
bundesliga_teams = JSON.parse(bundesliga_teams_serialized)

ligue1_teams_url = 'http://api.football-data.org/v1/competitions/450/teams'
ligue1_teams_serialized = open(ligue1_teams_url).read
ligue1_teams = JSON.parse(ligue1_teams_serialized)

laLiga_teams_url = 'http://api.football-data.org/v1/competitions/455/teams'
laLiga_teams_serialized = open(laLiga_teams_url).read
laLiga_teams = JSON.parse(laLiga_teams_serialized)

serieA_teams_url = 'http://api.football-data.org/v1/competitions/456/teams'
serieA_teams_serialized = open(serieA_teams_url).read
serieA_teams = JSON.parse(serieA_teams_serialized)

team_logos = {}

premier_teams["teams"].each do |team|
  team_name = team["name"]
  crest_url = team["crestUrl"]
  team_logos[team_name] = crest_url
end

bundesliga_teams["teams"].each do |team|
  team_name = team["name"]
  crest_url = team["crestUrl"]
  team_logos[team_name] = crest_url
end

ligue1_teams["teams"].each do |team|
  team_name = team["name"]
  crest_url = team["crestUrl"]
  team_logos[team_name] = crest_url
end

laLiga_teams["teams"].each do |team|
  team_name = team["name"]
  crest_url = team["crestUrl"]
  team_logos[team_name] = crest_url
end

serieA_teams["teams"].each do |team|
  team_name = team["name"]
  crest_url = team["crestUrl"]
  team_logos[team_name] = crest_url
end

Match.all.to_a.each do |match|
  home_team_name = match.home_team
  match.home_logo = team_logos[home_team_name]

  away_team_name = match.away_team
  match.away_logo = team_logos[away_team_name]
  match.save!
end










