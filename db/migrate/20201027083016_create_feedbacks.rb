class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :feedback
      t.string :received_via
      t.string :category
      t.string :tenant_name
      t.text :opinion

      t.timestamps
    end
  end
end
