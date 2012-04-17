FactoryGirl.define do
  factory :campaign do
    donation_target 30000
  end

  factory :donor do
    campaign
    email 'bob@emailville.com'
    street_address '2344 Willow Lane'
    city 'Bogliville'
    state 'IA'
    zip '75757'
  end

  factory :pledge do
    pledge_type 'fixed'
    amount 25
    cap 10.0
    donor
    campaign
  end
end
