class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
  end

  def about
  end

  def index
    tasks = current_user.tasks
    @active_tasks = tasks.where(is_active: true)
    @complete_tasks = tasks.where('updated_at > ?', Date.today)
    @passive_tasks = @complete_tasks.where(is_active: false)
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to '/tasks'
    else
      render '/tasks/new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to complete_tasks_path
  end

  # def destroy_all
  #   if self == nil?
  #     redirect_to complete_tasks_path
  #   else
  #     tasks = current_user.tasks
  #     deletable_tasks = tasks.where(updated_at < Date.yesterday)
  #     @passive_tasks = deletable_tasks.where(is_active: false)
  #     @passive_tasks.destroy_all
  #     redirect_to complete_tasks_path
  #   end
  # end

  def edit
    @task = Task.find(params[:id])
    if @task.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def change
    @task = Task.find(params[:id])
    if @task.is_active == true
      @task.update(is_active: false)
      redirect_to tasks_path
    else
      @task.update(is_active: true)
      redirect_to tasks_path
    end
  end

  def change_all
    tasks = current_user.tasks
    @active_tasks = tasks.where(is_active: true)
    @active_tasks.update(is_active: false)
    redirect_to tasks_path
  end

  def complete
    tasks = current_user.tasks
    @complete_tasks = tasks.where('updated_at > ?', !Date.today)
    @passive_tasks = @complete_tasks.where(is_active: false)
    @tasks = @passive_tasks.all.order(updated_at: :desc)
    @tasks = @passive_tasks.page(params[:page]).per(13)
  end

  private

  def task_params
    params.require(:task).permit(:task_ja, :task_en, :rating, :is_active)
  end
end
