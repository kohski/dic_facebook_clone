class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name,:email,:password,:password_confirmation))
    if @user.save
      redirect_to user_path(id:@user.id),notice: "登録完了しました"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
