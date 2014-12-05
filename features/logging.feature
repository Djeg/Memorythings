Feature: Logged in
    In order to use the application
    As anyone in the internet
    I should be able to log in

    Scenario: I am logged as a user
        Given I am on the homepage
        When I press "Login" button
        Then I should see a pop-in
        When I fill "my username" in "username"
        And I fill "my password" in "password"
        But the password is hidden
        And I press "Login"
        Then I should be on the memory grid edition page
        And I should see "Welcome my username"

    Scenario: I create my account
        Given I am on the homepage
        And I am not logged
        When I fill "my username" for "Username"
        And I fill "my password" for "Password"
        But The password is hidden
        And I fill the captcha code
        And I press "Sign up"
        Then I should be on the prompt email page
        And I should be logged

    Scenario: I create my account with an email
        Given I create my account
        Then I should be on the prompt email page
        When I fill my email for email
        And I press "Validate"
        Then I should be on the tutorial page
        And I should see "Your email has been saved. You will be notified if one of your public word has been validated"

    Scenario: I create my account without an email
        Given I create my account
        Then I should be on the prompt email page
        When I click on "No thanks" link
        Then I should be on the tutorial page

    Scenario: I am logged as an admin
        Given I am on the homepage
        When I press "Login" button
        Then I should see a pop-in
        When I fill "admin" in "username"
        And I fill "admin" in "password"
        But the password is hidden
        And I press "Login"
        Then I should be on the memory grid edition page
        And I should see "Welcome admin"

    Scenario: I logged out
        Given I am logged as user
        When I click on the dropdown menu
        Then I should see a dropdown menu with those actions:
            | Logout         |
        When I click on "Logout"
        Then I should not be logged
        And I should be on the homepage

