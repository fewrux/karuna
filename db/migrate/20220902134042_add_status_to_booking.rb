class AddStatusToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :status, :integer, default: 0
  end
end
