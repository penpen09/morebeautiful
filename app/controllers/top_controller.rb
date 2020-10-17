class TopController < ApplicationController
  def index
    @events = Event.order(created_at: :asc).limit(5)
  end
end
