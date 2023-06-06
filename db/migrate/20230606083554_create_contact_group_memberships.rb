class CreateContactGroupMemberships < ActiveRecord::Migration[6.1]
    def change
      create_table :contact_group_memberships do |t|
        t.belongs_to :contact
        t.belongs_to :contact_group
        t.timestamps
      end
  end
end
