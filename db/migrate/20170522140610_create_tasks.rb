class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.float :av_duration
      t.float :max_duration
      t.float :toc_factor
      t.boolean :completed
      t.date :due_date
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
