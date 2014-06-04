
class RemoveUserIdIdFromLikes < ActiveRecord::Migration
  def change
  	remove_column :likes, :user_id_id, :integer
  end
end
