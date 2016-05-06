class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :follower_id, presence: true, numericality: { only_integer: true }
end
