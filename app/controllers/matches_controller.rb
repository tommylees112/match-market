class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @premiership_matches = Match.where(league: "Premier League 2017/18")
    @bundesliga_matches = Match.where(league: "Bundesliga 2017/18")
    @laliga_matches = Match.where(league: "La Liga 2017/18")
    @ligue1_matches = Match.where(league: "Ligue 1 2017/18")
    @serieA_matches = Match.where(league: "Serie A 2017/18")
  end

  def show
    @match = Match.find(params[:id])
    @odds = @match.odds
  end
end
