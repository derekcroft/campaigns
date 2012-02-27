Transform /^#{dollar_amount}$/ do |amount|
  currency_to_i(amount)
end

## Fixed donation steps
Then /^I should see that the text field is disabled$/ do
  page.should have_css('.fixedamount[disabled="disabled"]')
end

Then /^I should see that the text field is enabled$/ do
  page.should have_no_css('.fixedamount[disabled="disabled"]')
end

When /^I click the "Donate A Fixed Amount" button$/ do
  choose('fixed_pledge_type')
end

Given /^I unlocked the Fixed Donation option$/ do
  choose('fixed_pledge_type')
end

When /^I put in a number less than (#{dollar_amount})$/ do |amount|
  fill_in('fixedamount', with: (amount-1).to_s)
end

When /^I click "Submit My Donation"$/ do
  click_on('submit_donation')
end

Then /^I should be back on (that campaign)'s index page$/ do |that_campaign|
  current_path.should == campaign_path(that_campaign)
end

Then /^I should see a message that tells me the minimum fixed donation is (#{dollar_amount})$/ do |amount|
  page.should have_css('.donation_error')
end
