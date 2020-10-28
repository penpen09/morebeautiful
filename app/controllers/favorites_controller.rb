class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.where(post_id: params[:post_id])
  end
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "#{favorite.post.user.name}の記事をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_url, notice: "#{favorite.post.user.name}さんの記事をお気に入り解除しました"
  end
end
