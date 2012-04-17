Feature: Billing

  As a donor to a Kiindly campaign
  I would like to be able to enter my credit card and contact information
  So I can complete my donation

  Background:
    Given a pledge exists

  Scenario: Server handles erroneous credit card information
    Given I am on the billing/donation page
    When I enter an email address
    And I enter a first name and a last name
    And I enter my zip code
    And I enter bogus credit card information
    And I check the box "I agree to the terms and conditions"
    And I click the complete donation button
    Then I should be on the billing/donation page
    And I should see an error that my credit card was invalid
 
