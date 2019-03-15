class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    # @picture = Picture.new(set_params)
    # if @picture.save
    @picture = current_user.pictures.build(set_params)
    if @picture.save
      redirect_to pictures_path,notice:"登録しました"
    else
      render 'new'
    end
  end
  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(set_params)
      redirect_to picture_path(id:@picture.id),notice:"編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path,notice:"削除しました"
  end

  def confirm
    @picture = Picture.new(set_params)
  end

  private

  def set_params
    params.require(:picture).permit(:image,:image_cache,:comment,:title,:user_id)
  end

end
