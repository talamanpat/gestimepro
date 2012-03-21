#require 'bcrypt'

class Usuario < ActiveRecord::Base
  # users.password_hash in the database is a :string
  #include BCrypt
  before_save :encrypt_password

  attr_accessor :password
  #validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :username

  def password

  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
