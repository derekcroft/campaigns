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

  Scenario: Widgets displayed on top of campaign section
    Given a campaign exists
    When I go to that campaign's index page
    Then I should see the Facebook like button
    And I should see a forward to a friend via email icon (opens email client)
    And I should see the google + button
    And I should see a Twitter tweet/share button

  Scenario Outline: View status of campaign
    Given a campaign exists
    And the donors have pledged <donation_total>
    And the pledge target is <donation_target>
    And there are <num_donors> donors
    When I go to that campaign's index page
    Then I should see a green bar with a pledge target of <donation_target>
    And it should be highlighted up to <donation_total>
    And I should see that the Current Level is <donation_total>
    And I should see that the Number of Donors is <num_donors>
  
    Examples:
      | num_donors | donation_total | donation_target |
      | 254        | $12,500        | $25,000         |
      | 5          | $8,000         | $24,000         |
