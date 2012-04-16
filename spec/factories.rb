FactoryGirl.define do
  factory :campaign do
    donation_target 30000
  end

  factory :donor do
    campaign
    email 'bob@emailville.com'
  end
end
