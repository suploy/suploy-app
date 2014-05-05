Feature: CRUD user
  In order to acces the suploy functionality
  As a regular user
  I want to register on the webpage

	Background:
		Given a test user exists

  Scenario: Register using regular Sign Up form
    Given I am on the register page
    When I supply my user information
    And I press "Sign up"
    Then I should see "Please open the link to activate your account"
    And I receive an email with a verification link

  Scenario: Register using GitHub OAuth
    Given I am on the login page
    When I click "github-auth"
    Then I should see "Successfully authenticated from GitHub account. "

  Scenario: Register using no data
    Given I am on the register page
		When I press "Sign up"
    Then I should see "errors prohibited this user from being saved"

  Scenario Outline: Change profile information
    Given I am logged in
    And I am on my profile page
    When I enter a new password "<new_password>"
    And confirm with my password "<old_password>"
    And logout
		Then I can login with the password: "<new_password>"

    Examples:
      | new_password  | old_password |
      | abc123        | password     |
      | dudelsack     | abc123       |

  Scenario: Delete account
    Given I am logged in
    And I am on my profile page
    When I press "Cancel my account"
    And confirm to delete
    Then I am logged off
    And can't login
