class PicturesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.order("id").reverse_order
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "写真を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "写真を削除しました！"
  end

  private
    def pictures_params
      params.require(:picture).permit(:image, :image_cache, :caption)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
