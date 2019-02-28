class TableProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects
    add_column :projects, :name, :string
    add_column :projects, :duration, :string
  end
end
