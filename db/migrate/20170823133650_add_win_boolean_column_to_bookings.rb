class AddWinBooleanColumnToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :won, :boolean
  end
end
