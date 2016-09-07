class User < ActiveRecord::Base
  has_secure_password
  #automatically creates virtual fields
  #password and password_confrimation
  #authenticate method on each object
  validates :password, presence: true, length: { minimum: 6 }
end
