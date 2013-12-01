class Booking < ActiveRecord::Base
    validates_presence_of :lawn_id, :time, :date
    belongs_to :lawn
end
