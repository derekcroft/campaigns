Given /^I am on the billing\/donation page$/ do
  visit(url_for([:pay, @campaign]))
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
  choose('card_type_visa')
  fill_in('card_number', with: '4111111111111111')
  fill_in('cvc', with: '123')
  fill_in('expiration_month', with: '12')
  fill_in('expiration_year', with: '20')
end

When /^I check the box "I agree to the terms and conditions"$/ do
  check('agree_to_terms')
end

When /^I click the complete donation button$/ do
  click_button('submit_donation')
end

Then /^I should be on the thank you page$/ do
  current_path.should == share_campaign_path(@campaign)
end

