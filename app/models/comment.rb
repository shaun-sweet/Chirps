class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :chirp
  has_many :likes
end
