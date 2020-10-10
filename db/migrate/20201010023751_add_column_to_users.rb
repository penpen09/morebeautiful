class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :icon, :text
    add_column :users, :profile, :text
    add_column :users, :make_tool, :text
    add_column :users, :youtube_channel, :string
  end
end
