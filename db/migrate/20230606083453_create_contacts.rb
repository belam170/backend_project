class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.belongs_to :user
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :organization
      t.timestamps
    end
  end
end
