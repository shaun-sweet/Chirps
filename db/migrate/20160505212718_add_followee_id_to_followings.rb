class AddFolloweeIdToFollowings < ActiveRecord::Migration
  def change
    add_column :followings, :followee_id, :integer
  end
end
