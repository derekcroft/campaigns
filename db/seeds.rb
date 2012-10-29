# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Donor.delete_all
Campaign.delete_all
Pledge.delete_all

Campaign.create(
  donation_target: 2500,
  ends_on: Date.new(2012, 10, 31),
  name: 'Healthy Chicago Initiative',
  subdomain: 'chi',
  contact_name: 'Fred Bear',
  contact_email: 'freddy@kiindly.com',
  starts_on: Date.new(2012, 9, 30),
  contact_phone: '3133342344'
)


