Feature: Billing

  As a donor to a Kiindly campaign
  I would like to be able to enter my credit card and contact information
  So I can complete my donation

  Background:
    Given a campaign exists

  Scenario: Successfully completing billing/donation page
    Given I am on the billing/donation page
    When I enter an email address
    And I enter a first name and a last name
    And I enter my zip code
    And I enter my credit card information
    And I check the box "I agree to the terms and conditions"
    And I click the complete donation button
    Then I should be on the thank you page
    And I should see a share pop up over the thank you page
 
