## Campaign Homepage
Given /^a campaign exists$/ do
  FactoryGirl.create(:campaign)
end

When /^I go to that campaign's index page$/ do
  that_campaign = Campaign.first
  visit(url_for(that_campaign))
end

Then /^I should see the page correctly$/ do
  that_campaign = Campaign.first
  current_path.should == campaign_path(that_campaign) 
end

Then /^I should see a Vimeo video embedded in the page$/ do
  page.should have_css('#video') 
end

Then /^I should see the Facebook like button$/ do
  page.should have_css('.addthis_button_facebook_like')
end

Then /^I should see a forward to a friend via email icon \(opens email client\)$/ do
  page.should have_css('.addthis_button_email')
end

Then /^I should see the google \+ button$/ do
  page.should have_css('.addthis_button_google_plusone')
end

Then /^I should see a Twitter tweet\/share button$/ do
  page.should have_css('.addthis_button_tweet')
end
