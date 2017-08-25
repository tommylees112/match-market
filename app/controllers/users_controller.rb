class UsersController < ApplicationController
  def dashboard
    @user = current_user
    case params[:b]
    when 'win'
      @user_bookings = @user.bookings.joins(:odd).joins(:match).where(won: true).order('matches.match_date DESC')
    when 'lost'
      @user_bookings = @user.bookings.joins(:odd).joins(:match).where(won: false).order('matches.match_date DESC')
    when 'pending'
      @user_bookings = @user.bookings.joins(:odd).joins(:match).where(won: nil).order('matches.match_date DESC')
    when 'all'
      @user_bookings = @user.bookings.joins(:odd).joins(:match).order('matches.match_date DESC')
    else
      @user_bookings = @user.bookings.joins(:odd).joins(:match).order('matches.match_date DESC')
    end

    case params[:s]
    when 'win'
      @created_odds = @user.odds.joins(:match).where(won: true).order('matches.match_date DESC')
    when 'lost'
      @created_odds = @user.odds.joins(:match).where(won: false).order('matches.match_date DESC')
    when 'pending'
      @created_odds = @user.odds.joins(:match).where(won: nil).order('matches.match_date DESC')
    else
      @created_odds = @user.odds.joins(:match).order('matches.match_date DESC')
    end

  end

  private

end
