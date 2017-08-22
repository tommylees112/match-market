class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @premiership_matches = Match.where(league: "Premier League 2017/18").page(params[:page])
    @bundesliga_matches = Match.where(league: "Bundesliga 2017/18").page(params[:page])
    @laliga_matches = Match.where(league: "La Liga 2017/18").page(params[:page])
    @ligue1_matches = Match.where(league: "Ligue 1 2017/18").page(params[:page])
    @serieA_matches = Match.where(league: "Serie A 2017/18").page(params[:page])
  end

  def show
    @match = Match.find(params[:id])
    @all_odds = @match.odds.all.order(:odds)
    @home_odds = @match.odds.where(outcome: "home").order(:odds)
    @away_odds = @match.odds.where(outcome: "away").order(:odds)
    @draw_odds = @match.odds.where(outcome: "draw").order(:odds)
  end
end
