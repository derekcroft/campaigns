Feature: Fixed Donation

  As a donor to a Kiindly campaign
  I would like to be able to enter my credit card and contact information
  So I can complete my donation

  Background:
    Given a campaign exists
    When I go to that campaign's index page
  
  Scenario: Fixed Donation text field is initially disabled
    Then I should see that the text field is disabled

  @javascript
  Scenario: Unlocked the Fixed Donation option
    When I click the "Donate A Fixed Amount" button
    Then I should see that the text field is enabled

  @javascript
  Scenario: Entering an invalid fixed donation into the text box
    Given I unlocked the Fixed Donation option
    When I put in a number less than $5.00
    And I click "Submit My Donation"
    Then I should be back on that campaign's index page
    And I should see a message that tells me the minimum fixed donation is $5.00
