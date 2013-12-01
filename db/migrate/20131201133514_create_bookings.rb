class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :lawn_id
      t.time :time
      t.date :date
      t.boolean :booked

      t.timestamps
    end
  end
end
