class TasksController < ApplicationController
  def top
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
      redirect_to '/tasks', notice: "追加されました"
    else
      render '/tasks/new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to complete_tasks_path
  end

  def destroy_all
    tasks = current_user.tasks
    deletable_tasks = tasks.where(updated_at < Date.yesterday)
    @passive_tasks = deletable_tasks.where(is_active: false)
    @passive_tasks.destroy_all
    redirect_to complete_tasks_path
  end


  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "変更されました"
    else
      render 'index'
    end
  end

  def change
    @task = Task.find(params[:id])
    @task.update(is_active: false)
    redirect_to tasks_path
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
  end


  private
    def task_params
      params.require(:task).permit(:task_ja, :task_en, :rating, :is_active)
    end
end

