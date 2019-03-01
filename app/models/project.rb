# app/models/project.rb
class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
end
