class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :client_name
      t.string :contact_type
      t.text :details

      t.timestamps
    end
  end
end
