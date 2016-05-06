class Following < ActiveRecord::Base
  belongs_to :users

  validates :user_id, presence: true
  validates :follower_id, presence: true
end
