class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :event_index]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:postlabelings, :labels).order(created_at: :desc)
    # @events = @events.where('event_date > ?', DateTime.now).order(event_date: :asc)
    # @events = @events.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def show
    # @comments = @event.comments
    # @comment = @event.comments.build
    if user_signed_in?
      @favorite = current_user.favorites.find_by(post_id: @post.id)
     end
     @favorites = Favorite.where(post_id: @post.id)
  end
  def post_index
  end

  def new
    @post = Post.new
  end

  def edit
  end

  # def confirm
  #  @event = current_user.events.build(event_params)
  #  render :new if @event.invalid?
  # end

  def create
    @post = current_user.posts.build(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if params[:back]
      render :new
    else
       if @post.save
         # eventMailer.contact_mail(@event).deliver
         redirect_to posts_path, notice: t('notice.create')
       else
         render :new
       end
    end
  end

  def update
    if params[:back]
      render :edit
    else
      if @post.update(post_params)
        redirect_to posts_path, notice: t('notice.update')
      else
        render :edit
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: t('notice.destroy')
  end

 private
 def set_post
   @post= Post.find(params[:id])
 end

 def post_params
   params.require(:post).permit(:image, :image_cache, :remove_image, :id, :content, :title, :cosmetic, :youtube_url,
     {label_ids:[]})
 end
end
