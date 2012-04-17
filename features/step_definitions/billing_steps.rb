And /^a pledge exists$/ do
  @pledge = FactoryGirl.create :pledge
end

Given /^I am on the billing\/donation page$/ do
  visit(new_campaign_pledge_path(@pledge.campaign, pledge_type: 'fixed', amount: 6))
end

When /^I enter an email address$/ do
  fill_in('email', with: 'jeff@email.com')
end

When /^I enter a first name and a last name$/ do
  fill_in('first_name', with: 'Jeff')
  fill_in('last_name', with: 'Porter')
end

When /^I enter my zip code$/ do
  fill_in('zip', with: '33069')
end

When /^I enter my credit card information$/ do
  fill_in('card_number', with: '4111111111111111')
  fill_in('card_code', with: '123')
  select('April', from: 'card_month')
  select('2017', from: 'card_year')
end

When /^I check the box "I agree to the terms and conditions"$/ do
  check('accept')
end

When /^I click the complete donation button$/ do
  click_button('submit_donation')
end

Then /^I should be on the thank you page$/ do
  current_path.should == campaign_pledges_path(@campaign)
end

