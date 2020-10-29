class ChangeColumnToUserMaketool < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :make_tool, :text, default: ""
  end
end
