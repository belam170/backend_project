class ContactGroup < ActiveRecord::Base
    has_many :contact_group_memberships
    has_many :contacts, through: :contact_group_memberships
  end
  