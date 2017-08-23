class RenameReferenceInBookings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bookings, :odds, foreign_key: true
    add_reference :bookings, :odd, foreign_key: true
  end
end
