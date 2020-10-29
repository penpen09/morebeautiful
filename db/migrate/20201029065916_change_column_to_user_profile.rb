class ChangeColumnToUserProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile, :text, default: ""
  end
end
