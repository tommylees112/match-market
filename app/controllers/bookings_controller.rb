class BookingsController < ApplicationController
  def create
    @booking = Booking.new(odd_id: params[:odd_id])
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end
end
