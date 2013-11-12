class ChangeDataTypeForNewsletterTitle < ActiveRecord::Migration
	def self.up
    	change_table :news_letters do |t|
    	t.change :title, :string
    end
  end
 
	def self.down
		change_table :news_letters do |t|
      	t.change :title, :text
    end
  end
end
