class Batch::CompletedTask


  #バッチ処理実装できず、実装できるまでadminページから手動で実行予定

  def self.all_create
    passive_tasks = Task.where(is_active: false)
    passive_tasks.each do |task|
      completed_task = CompletedTask.new
      completed_task.user_id = task.user_id
      completed_task.task_id = task.id
      completed_task.rating = task.rating
      completed_task.start_time = task.updated_at
      completed_task.save
    end
  end

  def self.create
    passive_tasks = Task.where(is_active: false)
    tasks = passive_tasks.where('updated_at > ?', Date.yesterday)
    tasks.each do |task|
      completed_task = CompletedTask.new
      completed_task.user_id = task.user_id
      completed_task.task_id = task.id
      completed_task.rating = task.rating
      completed_task.start_time = task.updated_at
      completed_task.save
    end
  end
end
