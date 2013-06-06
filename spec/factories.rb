FactoryGirl.define do
  factory :campaign do
    donation_target 30000
    sequence(:subdomain) { |n| "subdomain#{n}" }
  end

  factory :donor do
    campaign
    first_name 'James'
    last_name 'Berger'
    email 'bob@emailville.com'
    street_address '2344 Willow Lane'
    city 'Bogliville'
    state 'IA'
    zip '75757'
    stripe_customer 'customer_info_yaml'
    terms_of_service true
  end

  factory :pledge do
    pledge_type 'fixed'
    amount 25
    cap 10.0
    donor
    campaign
  end
end
