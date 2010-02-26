Feature: Likes
  In order Indicate that I like a  new presentation idea
  As a user I should be able to like an idea (just like as with Facebook)


  Background:
    Given presentation ideas Working with Git,Continuous Deployment
    And "Working with Git" has 0 likes
    And "Continuous Deployment" has 2 likes

  Scenario: Non logged in User is able to view the number of likes a presentation has
    Given I am on the homepage
    Then I should see "0" within "#presentationIdeas"
    And I should see "2" within "#presentationIdeas"



  Scenario: Logged in user should see number of likes a presentation has
    Given I have signed in with "email@person.com/password"
    And I am on the homepage
    Then I should see "0" within "#presentationIdeas"
    And I should see "2" within "#presentationIdeas"



Scenario: Logged in user can like a presentation
    Given I have signed in with "email@person.com/password"
    And I am on the homepage
    When I follow "Like This"
    Then I should see "Your liking of this presentation has been recorded"
    Then I should see "3" within "#presentationIdeas"

