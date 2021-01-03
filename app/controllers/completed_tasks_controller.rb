class CompletedTasksController < ApplicationController

  #バッチ処理実装できず、実装できるまでadminページから手動で実行予定

  def admin
    if current_user.id = 1
      @completed_tasks = CompletedTask.all
    else
      redirect_to root_path
    end
  end


  #タスク削除後も完了済タスクをカレンダーに表示させるため

  def all_create
    passive_tasks = Task.where(is_active: false)
    passive_tasks.each do |task|
      completed_task = CompletedTask.new
      completed_task.user_id = task.user_id
      completed_task.task_id = task.id
      completed_task.rating = task.rating
      completed_task.start_time = task.updated_at
      completed_task.save
    end
    redirect_to admin_path, notice: "全データの移行が完了しました"
  end

  def create
    passive_tasks = Task.where(is_active: false)
    tasks = passive_tasks.where('updated_at > ?', Date.yesterday)
    tasks.each do |task|
      completed_task = CompletedTask.new
      completed_task.user_id = task.user_id
      completed_task.task_id = task.id
      completed_task.rating = task.rating
      completed_task.start_time = Date.yesterday
      completed_task.save
    end
    redirect_to admin_path ,notice: "昨日分のデータ移行が完了しました"
  end

end
