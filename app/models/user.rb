class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_many :surveys, foreign_key: :creator_id
  has_many :votes, foreign_key: :voter_id
  validates_presence_of :username, :password
  validates_uniqueness_of :username
end
