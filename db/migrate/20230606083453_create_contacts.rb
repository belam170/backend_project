class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :nationality
      t.string :gender
      t.string :nickname
      t.string :organization
      t.timestamps
    end
  end
end