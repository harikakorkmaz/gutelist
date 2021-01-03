class CreateCompletedTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_tasks do |t|
      t.references :user
      t.references :task, unique: true
      t.integer :rating
      t.datetime :start_time

      t.timestamps
    end
  end
end
