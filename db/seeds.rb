puts "Seeding..."

user = User.create(name: 'John Doe', email: 'john@example.com', telephone_number: '1234567890', address: '123 Main St', relationship: 'Family')

contact = Contact.create(user_id: user.id, name: 'John', organization: 'Company A')

# Create contact groups
group1 = ContactGroup.create(name: 'Work')

# Add contacts to groups
ContactGroupMembership.create(contact: contact1, contact_group: group1)

puts "Seeding done."
