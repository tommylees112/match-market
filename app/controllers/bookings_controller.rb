class BookingsController < ApplicationController
  def create
    @booking = Booking.new(odds_id: params[:odd_id])
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end
end
