class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :chirp
  has_many :likes
  validates :body, presence: true, length: {maximum: 140}
end
