class AddUserIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user_id, index: true
  end
end
