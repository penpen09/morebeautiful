class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :eventrooms, :favorites, :following, :followers]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :following, :followers, :eventrooms, :event_index, :post_index, :favorites]
  def index
    @users = User.all
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: t('notice.update')
    else
      render :edit
    end
  end
  def show
      if params[:id] == "password"
        redirect_to new_user_session_path
      else
         @user = User.find(params[:id])
      end
    @eventrooms = current_user.eventrooms if user_signed_in?
  end

  def following
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @users = @user.followers
    render 'show_follower'
  end

  def eventrooms
    @events = @user.events
    @eventrooms = current_user.eventrooms.page(params[:page]).per(10)
  end

  def event_index
    @events = @user.events.page(params[:page]).per(10)
  end
  def post_index
    @posts = @user.posts.page(params[:page]).per(10)
  end
  def favorites
    @posts = @user.posts
    @favorites = current_user.favorites.page(params[:page]).per(10)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:id, :email, :icon, :icon_cache, :remove_icon, :name, :profile, :make_tool, :youtube_channel)
  end
  def check_user
    set_user
    unless current_user.try(:admin)
      if current_user.id != @user.id
        redirect_to user_path, notice: '権限がありません'
      end
    end
  end
end
