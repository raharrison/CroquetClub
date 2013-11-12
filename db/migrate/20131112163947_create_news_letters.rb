class CreateNewsLetters < ActiveRecord::Migration
  def change
    create_table :news_letters do |t|
      t.text :title
      t.date :date

      t.timestamps
    end
  end
end
