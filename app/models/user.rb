class User < ActiveRecord::Base
  has_many  :posts
  has_many  :comments

  validates :name, :user_name, :password, presence: true
  validates :user_name, uniqueness: true
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.auth(user_name, cleartext_pw)
    user = User.find_by(user_name: user_name)
    if user
      return user if user.password == cleartext_pw
      nil
    else
      nil
    end
  end

end

