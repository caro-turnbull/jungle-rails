class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  validates :email, presence: true

  has_secure_password
  
end
