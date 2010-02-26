Feature: Homepage
  In order Interact with the website
  As a user I should see navigation elements on the homepage

     Scenario: User Should see a sign up link if they are not signed in
        Given I am on the homepage
        Then I should see "Join SB on Rails"
        And I should not see "Add +"

    Scenario: User signs in and should not see sign up link
        Given I have signed in with "email@person.com/password"
        And I am on the homepage
        Then I should not see "Join SB on Rails"
        And I should see "Add +"



    Scenario: User visits homepage and should see directions button
        Given I am on the homepage
        Then I should see "Get Directions"


    Scenario: Singed in user visits homepage and should see directions button
        Given I have signed in with "email@person.com/password"
        And I am on the homepage
        Then I should see "Get Directions"

  Scenario: First five Presentation Ideas are shown
    Given presentation ideas Working with Git,Deployment,Chef,Favorite Plugins,Lightning Talks,I like Cake
    And I am on the homepage
    Then I should see "Working with Git"
    And I should see "Deployment"
    And I should see "Chef"
    And I should see "Favorite Plugins"
    And I should see "Lightning Talks"
    And I should not see "I like Cake"

