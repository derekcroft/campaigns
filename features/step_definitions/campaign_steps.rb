## Campaign Homepage
Given /^a campaign exists$/ do
  @campaign = FactoryGirl.create(:campaign)
end

When /^I go to that campaign's index page$/ do
  that_campaign = Campaign.first
  visit(url_for(that_campaign))
end

When /^I go to the Kiindly homepage$/ do
  visit(root_url)
end

Then /^I should see that campaign's index page$/ do
  that_campaign = Campaign.first
  current_path.should == campaign_path(that_campaign)
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

## Campaign donation setup steps
Given /^the donors have pledged (\$[\d,]+)$/ do |amount|
  @campaign.update_attribute(:donation_total, currency_to_i(amount))
end

Given /^the pledge target is (\$[\d,]+)$/ do |amount|
  @campaign.update_attribute(:donation_target, currency_to_i(amount))
end

Given /^there are (\d+) donors$/ do |number|
  @campaign.update_attribute(:number_of_donors, number)
end

Then /^I should see a green bar with a pledge target of (\$[\d,]+)$/ do |amount|
  page.should have_css('.donation_target')
  within('.donation_target') do
    page.text.should == amount
  end
end

Then /^I should see that the Number of Donors is (\d+)$/ do |number|
  page.should have_css('.number_of_donors')
  within('.number_of_donors') do
    page.should have_content(number)
  end
end

Then /^I should see that the Current Level is (\$[\d,]+)$/ do |amount|
  page.should have_css('.donation_total')
  within('.donation_total') do
    page.text.should == amount
  end
end

Then /^it should be highlighted up to (\$[\d,]+)$/ do |amount|
  donation_total = currency_to_i(amount)
  donation_target = @campaign.donation_target
  percent_complete = (donation_total/donation_target*100).to_i
  page.should have_css(".progressoverlay[style~='width:#{percent_complete}%']")
end


