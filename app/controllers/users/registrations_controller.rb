# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    default_task1 = Task.new
    default_task1.user_id = @user.id
    default_task1.task_ja = "ぐてリストに新規登録する"
    default_task1.task_en = "sign up for the gutelist"
    default_task1.rating = 2
    default_task1.is_active = false
    default_task1.save

    default_task2 = Task.new
    default_task2.user_id = @user.id
    default_task2.task_ja = "プロフィール画像を登録する"
    default_task2.task_en = "Set up your profile image"
    default_task2.rating = 2
    default_task2.is_active = true
    default_task2.save

    default_task3 = Task.new
    default_task3.user_id = @user.id
    default_task3.task_ja = "自己紹介を登録する"
    default_task3.task_en = "Set up your introduction"
    default_task3.rating = 1
    default_task3.is_active = true
    default_task3.save

    default_task4 = Task.new
    default_task4.user_id = @user.id
    default_task4.task_ja = "誰かをフォローする"
    default_task4.task_en = "Follow someone"
    default_task4.is_active = true
    default_task4.save

    default_task5 = Task.new
    default_task5.user_id = @user.id
    default_task5.task_ja = "ランキングを見る"
    default_task5.task_en = "View ranking"
    default_task5.rating = 1
    default_task5.is_active = true
    default_task5.save

    default_task5 = Task.new
    default_task5.user_id = @user.id
    default_task5.task_ja = "タスクを作成する"
    default_task5.task_en = "Create a task"
    default_task5.rating = 2
    default_task5.is_active = true
    default_task5.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
