class TopController < ApplicationController
  include AuthHelper
  def index
    @events = Event.limit(5).order(created_at: :desc)
    @login_url = get_login_url
  end
end
