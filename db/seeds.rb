puts "seeding ..."
user1 = User.create(name: 'John Doe', email: 'john@example.com', telephone_number: '1234567890', address: '123 Main St', relationship: 'Family')
user2 = User.create(name: 'Jane Smith', email: 'jane@example.com', telephone_number: '9876543210', address: '456 Elm St', relationship: 'Friend')


contact1 = Contact.create(user: user1, name: 'Alice', phone_number: '1111111111', email: 'alice@example.com', address: '789 Oak St', organization: 'Company A')
contact2 = Contact.create(user: user1, name: 'Bob', phone_number: '2222222222', email: 'bob@example.com', address: '456 Pine St', organization: 'Company B')
contact3 = Contact.create(user: user2, name: 'Eve', phone_number: '3333333333', email: 'eve@example.com', address: '789 Maple St', organization: 'Company C')

# Create contact groups
group1 = ContactGroup.create(name: 'Work')
group2 = ContactGroup.create(name: 'Family')
group3 = ContactGroup.create(name: 'Friends')

# Add contacts to groups
ContactGroupMembership.create(contact: contact1, contact_group: group1)
ContactGroupMembership.create(contact: contact2, contact_group: group1)
ContactGroupMembership.create(contact: contact1, contact_group: group2)
ContactGroupMembership.create(contact: contact3, contact_group: group3)
puts "done seeding..."