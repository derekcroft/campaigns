Feature: Fixed Donation

  As a donor to a Kiindly campaign
  I would like to be able to enter my credit card and contact information
  So I can complete my donation

  Background:
    Given a campaign exists
  
  Scenario: Fixed Donation text field is initially disabled
    When I go to that campaign's index page
    Then I should see that the text field is disabled

  @javascript
  Scenario: Unlocked the Fixed Donation option
    When I go to that campaign's index page
    When I click the "Donate A Fixed Amount" button
    Then I should see text field move from grey to white
    And I should see the text field unlock
