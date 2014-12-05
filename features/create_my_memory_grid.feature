Feature: Create my memory grid
    In order to create my personal memory grid
    As a user
    I should be able to select a word for each number

    Background:
        Given I have the default application words
        And I am logged as a user

    Scenario: Choose a word for each number
        Given I am on the memory grid edition page
        And I can see the 100 numbers
        And for each number I can see several word propositions
        When I select a word for each number
        And I validate my memory grid
        Then I should see my personal memory grid

    Scenario: Export my memory grid in PDF
        Given I follow the first scenario instructions
        When I press "Export to PDF"
        Then I should download my personal grid in PDF

    Scenario: Export my memory grid in CSV
        Given I follow the first scenario instructions
        When I press "Export to CSV"
        Then I should download my personal grid in CSV
