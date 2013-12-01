class Lawn < ActiveRecord::Base
    validates_presence_of :description
    has_many :bookings, :dependent => :destroy

    def to_s
        description
    end
end
