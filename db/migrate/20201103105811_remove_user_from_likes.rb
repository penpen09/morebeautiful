class RemoveUserFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :likes, :user, foreign_key: true
  end
end
