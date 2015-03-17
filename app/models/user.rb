class User < ActiveRecord::Base
  has_many :bees

  validates_uniqueness_of :name
  validates_presence_of :name, :email, :password


  has_secure_password
end
