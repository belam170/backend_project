class Contact < ActiveRecord::Base
    belongs_to :user
    has_many :contact_group_memberships
    has_many :contact_groups, through: :contact_group_memberships
  end