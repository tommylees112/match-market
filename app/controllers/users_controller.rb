class UsersController < ApplicationController
  def dashboard
    @user = current_user
    # @odds = Odd.find(@user)
    # owned_odds = how distinguish
  end
end
