class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, null: false
      t.string :task_ja
      t.string :task_en
      t.integer :rating
      t.boolean :is_active, default: true, null: false
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
