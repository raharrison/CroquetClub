class CoreController < ApplicationController
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
    @events = Event.all
  end

  def news_letters
    @title = "News Letters"
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

  def links
    @title = "Links to Croquet Sites"
  end
end
