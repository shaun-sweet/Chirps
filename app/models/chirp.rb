class Chirp < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :body, presence: true, length: { maximum: 140}
end
