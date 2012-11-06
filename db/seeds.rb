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
  donation_target: 100,
  ends_on: Date.new(2012, 12, 10),
  name: 'Healthy Initiative Chicago',
  subdomain: 'chi',
  contact_name: nil,
  contact_email: 'info@healthyinitiative.org',
  url: 'http://www.healthyinitiative.org',
  starts_on: Date.new(2012, 11, 5),
  match_amount: 100,
  campaign_type: 'dollar',
  contact_phone: nil
)


