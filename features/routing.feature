Feature: Routing

  As a potential donor to a Kiindly campaign
  I would like to be able to see the current campaign
  So I can decide if I want to donate to it

  Scenario: Go to campaign's home page
    Given a campaign exists
    When I go to that campaign's index page
    Then I should see the page correctly

  Scenario: Go to Kiindly's home page
    Given a campaign exists
    When I go to the Kiindly homepage
    Then I should see that campaign's index page
