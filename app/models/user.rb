class User < ActiveRecord::Base
  has_many :notifications
  has_many :chirps
  has_many :comments
  has_many :likes
  has_many :followings, foreign_key: "follower_id", class_name: "Following"
  has_many :followers, through: :followings

  validates :username, presence: true, length: { in: 5..50 }
  has_secure_password
  validates :email, presence: true, length: {maximum: 250}
  validates :email, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :first_name, presence: true, length: { in: 3..100 }
  validates :last_name, presence: true, length: { in: 3..100 }
  validates :image, format: {:with => URI.regexp}
end
