class AddStakeToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :stake, :integer
  end
end
