class TasksController < ApplicationController
  def top
  end
  
  def index
    @tasks = Task.all
    @active_tasks = Task.where(is_active: true)
    @passive_tasks = Task.where(is_active: false)
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
    redirect_back(fallback_location: root_path)
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
  
  def complete
    @passive_tasks = Task.where(is_active: false)
  end

  
  private
    def task_params
      params.require(:task).permit(:task_ja, :task_en, :rating, :is_active)
    end
end
