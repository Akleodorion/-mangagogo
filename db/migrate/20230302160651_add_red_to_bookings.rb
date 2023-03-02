class AddRedToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :red, :boolean
  end
end
