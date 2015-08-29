class User < ActiveRecord::Base
	has_secure_password
	has_many :surveys, foreign_key: :creator_id
	has_many :votes, foreign_key: :voter_id

  validates_presence_of :username, :password
  validates_uniqueness_of :username

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(username, cleartext_pw)
    user = User.find_by(username: username)
    if user
      return user if user.password == cleartext_pw
      nil
    else
      nil
    end
  end

end
