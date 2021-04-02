class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true 
  
  attr_reader :password
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def password(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_user(username, password) 
    user = User.find_by(username: username)
    return nil if user.nil?
    return user if user && user.is_password?(password)
  end

  # ensure session token exists
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end
end
