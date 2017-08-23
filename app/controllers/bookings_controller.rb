class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.odd = Odd.find(params[:odd_id])
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:stake)
  end
end
