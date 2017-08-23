class OddsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @odd = Odd.new(odd_params)
    @odd.match = Match.find(params[:match_id])
    @odd.user = current_user
    @odd.save
    redirect_to match_path(@odd.match)
  end

  private

  def odd_params
    params.require(:odd).permit(:odds, :outcome, :max_people)
  end
end
