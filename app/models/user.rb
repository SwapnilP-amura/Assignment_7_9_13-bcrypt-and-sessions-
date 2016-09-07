class User < ActiveRecord::Base
  has_secure_password
  #automatically creates virtual fields
  #password and password_confrimation
  #authenticate method on each object

end
