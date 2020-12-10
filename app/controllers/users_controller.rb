class UsersController < ApplicationController

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: "変更されました"
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :introduction, :image_id)
    end
end
