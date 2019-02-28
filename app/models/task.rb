# app/models/task.rb
class Task < ActiveRecord::Base
  has_many :project
end
