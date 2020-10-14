class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  def index
    @labels = Label.all
  end

  def show
  end

  def new
    @label = Label.new
  end

  def edit
  end
  def create
    @label = Label.new(label_params)
    if params[:back]
      render :new
    else
       if @label.save
         redirect_to @label, notice: '新規作成しました！'
       else
         render :new
       end
    end
  end

  def update
    if params[:back]
      render :edit
    else
      if @label.update(label_params)
        redirect_to @label, notice: '編集しました！'
      else
        render :edit
      end
    end
  end

  def destroy
    @label.destroy
    redirect_to labels_url, notice: '削除しました！'
  end

  private
    def set_label
      @label = Label.find(params[:id])
    end

    def label_params
      params.require(:label).permit(:name)
    end
    def check_admin
      unless current_user.try(:admin?)
        redirect_to events_path, notice: '権限がありません'
      end
    end
end
