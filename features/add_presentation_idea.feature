Feature: Add Presentation Idea
    In order to get new ideas for upcoming presentations
    As a User I should be able to suggest a new presentation topic

    Scenario: User is logged in and suggests a topic
      Given I have signed in with "bob@yahoo.com/password"
      And I am on the add presentation idea page
      When I fill in the following:
      | title             | Some neat talk          |
      | short description | a neat talk by some guy |

      And I press "Suggest Presentation"
      Then I should see "Some neat talk" within "#presentationIdeas"

