class SetBookedDefaultValue < ActiveRecord::Migration
  def change
    change_column :bookings, :booked, :boolean, :default => false
  end
end
