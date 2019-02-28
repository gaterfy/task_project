class AddTaskIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :task_id, :integer
    add_index :projects, :task_id
  end
end
