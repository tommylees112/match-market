class MatchesController < ApplicationController
  def index
    @matches = Match.page(params[:page])
  end

  def show
    @match = Match.find(params[:id])
    @odds = @match.odds
  end
end
