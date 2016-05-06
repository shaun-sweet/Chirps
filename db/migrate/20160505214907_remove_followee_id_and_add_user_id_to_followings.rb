class RemoveFolloweeIdAndAddUserIdToFollowings < ActiveRecord::Migration
  def change
    remove_column :followings, :followee_id, :integer
    add_column :followings, :user_id, :integer
  end
end
