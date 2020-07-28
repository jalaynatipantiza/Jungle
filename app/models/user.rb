class User < ActiveRecord::Base

  has_secure_password

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  

end