class User < ActiveRecord::Base
  has_many :notifications
  has_many :chirps
  has_many :comments
  has_many :likes
  # belongs_to_and_has_many :following
end
