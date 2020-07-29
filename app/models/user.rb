class User < ActiveRecord::Base
  
  has_secure_password

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials (email, password)
    user = self.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end