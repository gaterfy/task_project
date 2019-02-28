class TableTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks
    add_column :tasks, :name, :string
    add_column :tasks, :duration, :string
  end
end
