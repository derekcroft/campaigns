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
  pending
end
