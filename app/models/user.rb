# app/models/user.rb
class User < ActiveRecord::Base
  validates :password, presence: true,
                    length: {minimum: 8, maximum: 30}, allow_nil: true
  validates :lastname, presence: true,
                    length: { minimum: 4}
  validates :name, uniqueness: true, presence: true,
                    length: { minimum: 4}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :projects
  before_save :update_avatar_attributes
  mount_uploader :avatar, AvatarUploader
  has_secure_password

  private
    def update_avatar_attributes
      if avatar.present? && avatar_changed?
        self.avatar_content_type = avatar.file.content_type
        self.avatar_file_size = avatar.file.size
      end
    end


  #p downcase_attributes.email


end
