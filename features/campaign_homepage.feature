Feature: Campaign Homepage

  As a potential donor to a Kiindly campaign
  I would like to be able to see the campaign homepage
  So I can get information about the current state of that campaign

  Scenario: Go to campaign's home page
    Given a campaign exists
    When I go to that campaign's index page
    Then I should see the page correctly

  Scenario: Play video
    Given a campaign exists
    When I go to that campaign's index page
    Then I should see a Vimeo video embedded in the page
