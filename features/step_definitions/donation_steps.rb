## Fixed donation steps
Then /^I should see that the text field is disabled$/ do
  page.should have_css('.fixedamount[disabled="disabled"]')
end

When /^I click the "Donate A Fixed Amount" button$/ do
  choose('fixed_pledge_type')
end

Then /^I should see text field move from grey to white$/ do
  page.should have_no_css('.fixedamount[disabled="disabled"]')
end
