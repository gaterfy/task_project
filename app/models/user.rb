# app/models/user.rb
class User < ActiveRecord::Base
  belongs_to :project
end
