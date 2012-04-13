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
c = Campaign.create(donation_total: 17958, donation_target: 55000)
2.times { c.donors.create }

