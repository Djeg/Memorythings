Feature: Manager personal words
    In order to manage my personal word
    As a user or an admin
    I should be able to edit, remove, change status or cancel public word submission

    Scenario: Edit a private word
        Given I am logged as a user
        And I am on the homepage
        When I click on the dropdown menu
        And I click on "Personal words"
        Then I should be on the personal words list page
        And I should see a table containing the following headers:
            | Word | Status | Actions |
        And In "Action" column I should see the following buttons for a private word:
            | Edit            |
            | Remove          |
            | Submit publicly |
        When I click on "Edit" button for a private word
        Then I should be on the word edition page
        And I should see a form with the following fields
            | Word   |
            | Status |
        When I fill "Edited word" in "Word"
        And I press "Validate"
        Then I should be on the personal words list page
        And I should see "The word 'Edited word' has been edited."

    Scenario: Submit a private word to the public domain
        Given I am logged as a user
        And I am on the homepage
        When I click on the dropdown menu
        And I click on "Personal words"
        Then I should be on the personal words list page
        And I should see a table containing the following headers:
            | Word | Status | Actions |
        And In "Action" column I should see the following buttons for a private word:
            | Edit            |
            | Remove          |
            | Submit publicly |
        When I click on "Edit" button for a private word
        Then I should be on the word edition page
         When I click on "Submit publicly" for a private word
         Then I should be on the same page
         And I should see "The word 'Word' has been submit publicly."
         And I still should see the private word but with the status "pending"
         And I wait for an admin to validate it
         And The word should become public

    Scenario: Cancel a submition of a pending word
        Given I submit a private word to the public domain
        But the admin hasn't validated the word yet
        And I am on the personal word list page
        Then I should see a table containing the following headers:
            | Word | Status | Actions |
        And In "Action" column I should see the following buttons for a submited pending word:
            | Cancel submition |
        When I click on "Cancel submition"
        Then I should be on the same page
        And I should see the word '???' is now private
        And the status of the word has changed to "private"
        And the admin should not be able to validate this word anymore

    Scenario: I should not be able to act on a public word
        Given I am on the personal word list page
        Then I should see a table containing the following headers:
            | Word | Status | Actions |
        And In "Action" column I should not see any action for a submited pending word
