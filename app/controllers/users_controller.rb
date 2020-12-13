class UsersController < ApplicationController
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    tasks_root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

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
