class Event < ActiveRecord::Base
    validates_presence_of :title, :date, :description
end
