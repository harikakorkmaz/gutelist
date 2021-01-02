class CreateCompletedTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_tasks do |t|
      t.integer :user_id, null: false
      t.integer :task_id, unique: true, null: false
      t.integer :rating, default: 0, null: false
      t.datetime :start_time

      t.timestamps
    end
  end
end
