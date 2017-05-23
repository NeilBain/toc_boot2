class ChangeTaskDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default :tasks, :av_duration, 1
    change_column_default :tasks, :max_duration, 1
  end
end
