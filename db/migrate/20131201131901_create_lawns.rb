class CreateLawns < ActiveRecord::Migration
  def change
    create_table :lawns do |t|
      t.text :description

      t.timestamps
    end
  end
end
