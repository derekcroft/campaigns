Feature: Facebook registration

  As a donor
  In order to fill out as few fields as possible when making my donation
  I want to be able to use my Facebook account to fill out my information

  When a donor chooses the penny pledge or the fixed donation, the next
  page they go to is the registration/payment page.  This page has fields 
  for their email, name, zip code, etc.  They should have the option 
  to use their Facebook account to pre-fill the fields on this page 
  instead of filling them in by themselves.

  Background:
    Given a campaign exists
    And I am not logged into Facebook
    And I go to the registration/payment page for that campaign

  @javascript
  Scenario: Option to log in with Facebook
    Then I should see the Facebook login button
    But I should not see the Facebook registration frame

#  @javascript @firefox
#  Scenario: Logging in with Facebook
#    When I click the Facebook login button
#    Then I should see the Facebook login popup

#  @javascript @firefox
#  Scenario: Entering Facebook credentials
#    When I click the Facebook login button
#    And I fill in the email and password of a test user
#    And I click "Log in"
#    Then I should be back on the registration/payment page
#    And I should see the Facebook registration frame
#    And I should see my first name, last name, and email prefilled
#    But I should see that my zip code and phone are not prefilled
