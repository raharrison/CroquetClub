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
  end

  def reset_lawns
    Lawn.all.each do |lawn|
      lawn.booked = false
      lawn.save
    end
  end

  def update_lawn
    @lawn = Lawn.find(params[:lawn_id])
    @lawn.booked = true
    @lawn.save
    $lawn_updated = @lawn
  end

  def lawn_monitor
    response.headers['Content-Type'] = "text/event-stream"

    sse = Messenger::SSE.new(response.stream)

    begin
      sse.write({ :lawn_id => $lawn_updated.id, :booked => $lawn_updated.booked}, :event => 'update')
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
