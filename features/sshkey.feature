Feature: ssh-key
  In order to create a ssh-key
  one must be logged in, the ssh-key
  must be valid, and a fingerprint
  must be creatable from it

  Background:
    Given a test user exists

  Scenario: 80% Happy Path
    Given I am logged in
    And I am on the new ssh-key page
    When I provide a title
    And I provide a valid ssh-key
    And I press "CREATE SSH KEY"
    Then I should see "SSH Key was successfully created."
    And I should see "title"
    And I should see "df:8f:35:f8:e7:84:c9:c3:e4:5f:22:27:a9:44:e0:a4"

  Scenario: No Title provided
		Given I am logged in
    And I am on the new ssh-key page
    When I provide a valid ssh-key
    And I press "CREATE SSH KEY"
    Then I should see "error"

  Scenario: No ssh-key provided
		Given I am logged in
    And I am on the new ssh-key page
    When I provide a title
    And I press "CREATE SSH KEY"
    Then I should see "error"

  Scenario: Whether title nor key have been provided
		Given I am logged in
    And I am on the new ssh-key page
    When I press "CREATE SSH KEY"
    Then I should see "error"

  Scenario: Remove ssh-key
		Given I am logged in
    And I have a valid ssh-key added
    And I am on the sshkey overview page
    When I click "Delete"
    Then I should see "removed"
