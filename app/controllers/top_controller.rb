class TopController < ApplicationController
  include AuthHelper
  def index
    @events = Event.limit(5).order(event_date: :asc).where('event_date > ?', DateTime.now)
    @login_url = get_login_url
  end
end
