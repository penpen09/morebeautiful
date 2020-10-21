class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :event_index]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    search_options = {
      created_after: params[:created_after],
      created_before: params[:created_before]
      }
    @q = Event.ransack(params[:q], search_options)
    @events = @q.result(distinct: true).includes(:labelings, :labels).order(event_date: :asc).where('event_date > ?', DateTime.now)
    # @events = @events.where('event_date > ?', DateTime.now).order(event_date: :asc)
    # @events = @events.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def show
    @comments = @event.comments
    @comment = @event.comments.build
    if user_signed_in?
     @eventroom = current_user.eventrooms.find_by(event_id: @event.id)
    end
    @eventrooms = Eventroom.where(event_id: @event.id)
  end
  def event_index
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
         redirect_to events_path, notice: t('notice.create')
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
        redirect_to events_path, notice: t('notice.update')
      else
        render :edit
      end
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: t('notice.destroy')
  end

 private
 def set_event
   @event = Event.find(params[:id])
 end

 def event_params
   params.require(:event).permit(:image, :image_cache, :id, :content, :title, :event_date, :place, :fee, :contact, :owner_id, {
     label_ids:[]
     })
 end
end
