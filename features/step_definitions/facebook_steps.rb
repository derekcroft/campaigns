Given /^I am not logged into Facebook$/ do
  ## nothing necessary
end

When /^I go to the registration\/payment page for (that campaign)$/ do |campaign|
  visit(new_campaign_pledge_path(campaign, fixedamount: 6))
end

Then /^I should see the Facebook login button$/ do
  page.should have_css("#fb-login a.fb_button")
end

But /^I should not see the Facebook registration frame$/ do
  page.should have_no_css("#fb-registration")
end

And /^I click the Facebook login button$/ do
  find("#fb-login a.fb_button").click
end

Then /^I should see the Facebook login popup$/ do
  within_window(page.driver.browser.window_handles.last) do
    page.should have_css("html#facebook")
  end
end