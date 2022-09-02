class RemoveUserIdAndProjectIdFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :user_id, :integer
    remove_column :bookings, :project_id, :integer
  end
end
