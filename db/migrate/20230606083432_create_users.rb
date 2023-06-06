class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :telephone_number
      t.string :address
      t.string :relationship
      t.timestamps
    end
  end
end
