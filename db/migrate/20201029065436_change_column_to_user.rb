class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :youtube_channel, :string, default: ""
  end
end
