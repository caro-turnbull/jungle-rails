class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  has_secure_password

end
