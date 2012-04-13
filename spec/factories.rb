FactoryGirl.define do
  factory :campaign do
  end

  factory :donor do
    campaign
  end
end
