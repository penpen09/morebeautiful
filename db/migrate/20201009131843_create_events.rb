class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :image
      t.datetime :event_date
      t.string :place, null: false
      t.integer :fee, null: false
      t.text :contact
      t.integer :owner_id
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
