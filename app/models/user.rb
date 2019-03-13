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
  before_save :downcase_attributes
  has_secure_password

  private
  def downcase_attributes
    self.email = self.email&.downcase
    self.name = self.name&.downcase
    self.lastname = self.lastname.downcase
    #self.recovery_email = self.recovery_email&.downcase
  end


  #p downcase_attributes.email


end
