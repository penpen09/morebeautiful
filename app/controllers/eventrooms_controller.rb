class EventroomsController < ApplicationController
  def create
    eventroom = current_user.eventrooms.create(event_id: params[:event_id])
    redirect_to events_url, notice: "#{eventroom.event.user.name}のイベントに参加しました"
  end
  def destroy
    eventroom = current_user.eventrooms.find_by(id: params[:id]).destroy
    redirect_to events_url, notice: "#{eventroom.event.user.name}さんのイベントをキャンセルしました"
  end
end
