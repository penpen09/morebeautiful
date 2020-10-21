class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:create, :edit, :update]

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to event_path(@event), notice: t('notice.comments.create') }
      end
    end
  end

  def edit
    @comment = @event.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = t('flash.comments.editing')
      format.js { render :edit }
    end
  end

  def update
    @comment = @event.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = t('flash.comments.edit_success')
          format.js { render :index }
        else
          flash.now[:notice] = t('flash.comments.edit_failure')
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = t('flash.comments.destroy_success')
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :event_id, :content)
  end
  def set_event
    @event = Event.find(params[:event_id])
  end

end
