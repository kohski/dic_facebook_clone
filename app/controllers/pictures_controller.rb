class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    if logged_in?
      @picture = Picture.new
    else
      redirect_to new_session_path,notice:"最初にログインしてください"
    end
  end

  def confirm
    @picture = Picture.new(set_params)
    @picture.user_id = current_user.id
    render 'new' if @picture.invalid?
  end

  def create    
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
    if Picture.find(params[:id]).user_id == current_user.id
      @picture = Picture.find(params[:id])
    else
      redirect_to pictures_path, notice:"他ユーザーの投稿は編集できません。"
    end
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

  private

  def set_params
    params.require(:picture).permit(:image,:image_cache,:comment,:title,:user_id)
  end

end
