class MatchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index


   if params[:search].present?
    # @matches = Match.where('home_team LIKE ? OR away_team LIKE ?, "%#{params[:search].downcase}%", "%#{params[:search].downcase}%"')
    @premiership_matches = Match.where('lower(home_team) LIKE ? or lower(away_team) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order(:match_date)
    @bundesliga_matches = Match.where('lower(home_team) LIKE ? or lower(away_team) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order(:match_date)
    @laliga_matches = Match.where('lower(home_team) LIKE ? or lower(away_team) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order(:match_date)
    @ligue1_matches = Match.where('lower(home_team) LIKE ? or lower(away_team) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order(:match_date)
    @serieA_matches = Match.where('lower(home_team) LIKE ? or lower(away_team) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order(:match_date)
    else
    @premiership_matches = Match.where(league: "Premier League 2017/18").order(:match_date)
    @bundesliga_matches = Match.where(league: "Bundesliga 2017/18").order(:match_date)
    @laliga_matches = Match.where(league: "La Liga 2017/18").order(:match_date)
    @ligue1_matches = Match.where(league: "Ligue 1 2017/18").order(:match_date)
    @serieA_matches = Match.where(league: "Serie A 2017/18").order(:match_date)
   end


  end



  def show
    @match = Match.find(params[:id])
    @odd = Odd.new
    @booking = Booking.new
    @comment = Comment.new
    @all_odds = @match.odds.all.order(:odds)
    @home_odds = @match.odds.where(outcome: "Home").order(:odds)
    @away_odds = @match.odds.where(outcome: "Away").order(:odds)
    @draw_odds = @match.odds.where(outcome: "Draw").order(:odds)
  end
end
