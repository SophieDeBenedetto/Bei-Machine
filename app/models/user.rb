class User < ActiveRecord::Base
  has_many :bees

  # before_save :encrypt_password

  validates_confirmation_of :password
  validates_uniqueness_of :name
  validates_presence_of :name, :email, :password
  validates_presence_of :password, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  has_secure_password
end

#   def encrypt_password

#     if password.present? 
#       self.password_salt = BCrypt::Engine.generate_salt
#       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
#     end
#   end
# end
