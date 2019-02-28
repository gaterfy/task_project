# app/models/project.rb
class Project < ActiveRecord::Base
  has_many :user
  belongs_to :task
end
