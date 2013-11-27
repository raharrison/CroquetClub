class CreateLawns < ActiveRecord::Migration
  def change
    create_table :lawns do |t|
      t.boolean :booked

      t.timestamps
    end
  end
end
