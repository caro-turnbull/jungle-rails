class User < ApplicationRecord
<<<<<<< HEAD
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  validates :email, presence: true

  has_secure_password

  
=======
  has_secure_password
>>>>>>> master
end
