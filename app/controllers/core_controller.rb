require 'messenger/sse'

class CoreController < ApplicationController
  include ActionController::Live

  def index
    @title = "Home"
  end

  def about_the_club
    @title = "About the Club"
  end

  def how_to_join
    @title = "How to Join"
  end

  def what_you_need
    @title = "What You Need"
  end

  def programme
    @title = "#{Time.now.year} Programme"
    @events = Event.where("date >= ?", Time.now).order(date: :asc).all
    @past_events = Event.where("date < ?", Time.now).order(date: :desc).all
  end

  def news_letters
    @title = "News Letters"
    @letters = NewsLetter.order(date: :desc).all
    @grouped = @letters.group_by {|y| y.date.year }
  end

  def club_matters
    @title = "Club Matters"
  end

  def how_to_get_there
    @title = "How to get There"
  end

  def book_a_lawn
    @title = "Book a Lawn"
    @bookings = Booking.all.group_by { |b| b.lawn_id }
  end

  def update_booking
    @booking = Booking.find(params[:booking_id])
    @booking.booked = true
    @booking.save
    $last_updated = @booking.id
    @lawn = Lawn.find(@booking.lawn_id)
  end

  def booking_monitor
    response.headers['Content-Type'] = "text/event-stream"

    sse = Messenger::SSE.new(response.stream)
    booking = Booking.find($last_updated)
    begin
      sse.write({ :booking_id => booking.id, :booked => booking.booked}, :event => 'update')
    rescue
      #When client disconnects get IOError
    ensure
      sse.close
    end
  end

  def links
    @title = "Links to Croquet Sites"
  end
end
