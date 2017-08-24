class MatchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @matches = Match.all
    @premiership_matches = Match.where(league: "Premier League 2017/18").order(:match_date)
    @bundesliga_matches = Match.where(league: "Bundesliga 2017/18").order(:match_date)
    @laliga_matches = Match.where(league: "La Liga 2017/18").order(:match_date)
    @ligue1_matches = Match.where(league: "Ligue 1 2017/18").order(:match_date)
    @serieA_matches = Match.where(league: "Serie A 2017/18").order(:match_date)
  end

  def show
    @match = Match.find(params[:id])
    @odd = Odd.new
    @booking = Booking.new
    @all_odds = @match.odds.all.order(:odds)
    @home_odds = @match.odds.where(outcome: "Home").order(:odds)
    @away_odds = @match.odds.where(outcome: "Away").order(:odds)
    @draw_odds = @match.odds.where(outcome: "Draw").order(:odds)
  end
end
