class Lawn < ActiveRecord::Base
    validates_presence_of :description
    has_many :bookings, :dependent => :destroy
end
