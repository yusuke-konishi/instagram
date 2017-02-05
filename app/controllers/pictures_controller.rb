class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(pictures_params)
    redirect_to pictures_path, notice: "写真を投稿しました！"
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(pictures_params)
    redirect_to pictures_path, notice: "投稿を更新しました！"
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end

  private
    def pictures_params
      params.require(:picture).permit(:image, :caption)
    end
end
