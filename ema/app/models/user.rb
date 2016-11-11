class User < ActiveRecord::Base
    has_many :invitations
	has_many :events, through: :invitation
	attr_accessor  :password, :password_confirmation
  
  
  before_save :encrypt_password
  
  validates :password, format:{with: /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}\z/, message: " - Should contain 1 Uppercase, 1 Number, 1 Special Character and should be of minimum 8 Characters."} 
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
