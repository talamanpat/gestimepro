class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  attr_accessible :email, :password, :password_confirmation, :nombre, :apellido, :admin

  #validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  #validates_presence_of :email
  #validates_uniqueness_of :email


  validates :email,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}



  validates :password,
            :confirmation => true,
            :presence => {
                :on => :create
            }

  validates :nombre,
            :presence => true


  has_many :tareas

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end


end
