class AddPdfToNewsLetters < ActiveRecord::Migration
  def change
    add_column :news_letters, :pdf, :string
  end
end
