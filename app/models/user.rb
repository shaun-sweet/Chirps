class User < ActiveRecord::Base
  has_many :notifications
  has_many :chirps
  has_many :comments
  has_many :likes
  # belongs_to_and_has_many :following
  has_many :followings, foreign_key: "follower_id", class_name: "Following"
  has_many :followers, through: :followings
end
