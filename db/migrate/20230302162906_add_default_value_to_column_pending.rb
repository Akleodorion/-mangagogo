class AddDefaultValueToColumnPending < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :red, false
  end
end
