Feature: Add a new word for a given number
    In order to customize my personal memory grid
    As a user
    I should be able to add a word for a given number

    Scenario: Create a public word for a number
        Given i am logged as a user
        And I am in the memory grid edition page
        When I follow the little icon "plus" for the number 5
        And I fill "My word" in the "Word" input
        And I check "public" for the "status" radio
        And I press "Validate"
        Then I am on the memory grid edition page
        And I should see "The word 'My word' has been submited. The admin will validate it soon."
        And I wait for the admin to validate the word
        And I can select the word "My word" for the number 5

    Scenario: Create a private word for a number
        Given I am logged as a user
        And I am in the memory grid edition page
        When I follow the little icon "plus" for the number 5
        And I fill "My word" in the "Word" input
        And I check "private" for the "status" radio
        And I press "Validate"
        Then I am on the memory grid edition page
        And I should see "The word 'My word' has been created."
        And I can select the word "My word" for the number 5
        But I am the only to be able to select it
