class AddEmailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    add_column :users, :lastname, :string
    add_column :users, :color, :string
  end
end
