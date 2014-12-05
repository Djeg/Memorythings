Feature: Manage a pending word
    In order to check that a submited word is relevant for a specific number
    As an admin
    I should be able to manager a public word

    Scenario: I validate a word
        Given I am logged as an admin
        When I click on the dropdown menu
        Then I should see a dropdown menu with those actions:
            | Pending words  |
            | Personal words |
            | Logout         |
        When I click on "Pending words"
        Then I should be on the pending words administration page
        And I should a table containing the folowing headers:
            | ID | Word | Number | Author | Actions |
        And In "Actions" headers column, I should see 3 buttons:
            | accept |
            | refuse |
            | edit   |
        When I click on "accept" for the first word in the table
        Then I should be on the same page
        And I should see "The word '???' has been validated."
        And the word should not be in the table anymore
        And If the "Author" has specified his email, then he should receive a notification by mail

    Scenario: I refuse a word
        Given I am logged as an admin
        When I click on the admin dropdown menu
        And I click on "Pending words"
        And I click on "refuse" for the first word in the table
        Then I should see "The word '???' has been refused."
        And the word should not be in the table anymore
        And If the "Author" has specified his email, then he should receive a notification by mail

    Scenario: I edit a word
        Given I am logged as an admin
        When I click on the admin dropdown menu
        And I click on "Pending words"
        And I click on "edit" for the first word in the table
        Then I should be on the word edition page
        But I should not see the "Status" radio
        When I fill "My word" for "Word"
        And I press "Save"
        Then I should be on the pending administration word page
        And I should see "The word 'My word' has been edited."
        And the word is still visible in the list
