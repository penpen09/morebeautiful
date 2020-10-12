class CreateEventrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :eventrooms do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
