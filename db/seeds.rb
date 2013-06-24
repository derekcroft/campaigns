# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#Campaign.where(subdomain: 'chi').first_or_create(
  #donation_target: 100,
  #ends_on: Date.new(2012, 12, 24),
  #name: 'Healthy Initiative Chicago',
  #contact_name: nil,
  #contact_email: 'info@healthyinitiative.org',
  #url: 'http://www.healthyinitiative.org',
  #starts_on: Date.new(2012, 11, 26),
  #match_amount: 100,
  #campaign_type: 'dollar',
  #contact_phone: nil
#)

Campaign.where(subdomain: 'lts').first_or_create(
  donation_target: 100,
  donor_target: 500,
  ends_on: Date.new(2013, 8, 18),
  name: 'Live To Support',
  contact_name: 'Derek Croft',
  contact_email: 'derek@kiindly.com',
  url: 'http://www.livetosupport.com',
  starts_on: Date.new(2013, 6, 24),
  match_amount: 100,
  campaign_type: 'dollar',
  contact_phone: nil
)

Team.import!
