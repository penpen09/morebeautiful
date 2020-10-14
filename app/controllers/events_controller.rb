class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @comments = @event.comments
    @comment = @event.comments.build
    if user_signed_in?
    @eventroom = current_user.eventrooms.find_by(event_id: @event.id)
    end
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def confirm
   @event = current_user.events.build(event_params)
   render :new if @event.invalid?
  end

  def create
    @event = current_user.events.build(event_params)
    if params[:back]
      render :new
    else
       if @event.save
         # eventMailer.contact_mail(@event).deliver
         redirect_to @event, notice: '新規作成しました！'
       else
         render :new
       end
    end
  end

  def update
    if params[:back]
      render :edit
    else
      if @event.update(event_params)
        redirect_to @event, notice: '編集しました！'
      else
        render :edit
      end
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: '削除しました！'
  end

 private
 def set_event
   @event = Event.find(params[:id])
 end

 def event_params
   params.require(:event).permit(:image, :image_cache, :id, :content, :title, :event_date, :place, :fee, :contact, :owner_id)
 end

 def check_event
   if current_user.id != @event.user.id
     redirect_to events_path, notice: '権限がありません'
   end
 end
end
