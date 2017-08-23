class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @created_odds = @user.odds
    # @booked_odds = @user.bookings
    # owned_odds = how distinguish from bought odds?
  end
end
