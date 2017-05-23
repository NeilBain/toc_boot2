class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.float :min_duration
      t.float :max_duration
      t.float :predicted_duration

      t.timestamps
    end
  end
end
