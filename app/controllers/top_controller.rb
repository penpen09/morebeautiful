class TopController < ApplicationController
  include AuthHelper
  def index
    @events = Event.order(created_at: :asc).limit(5)
    @login_url = get_login_url
  end
end
