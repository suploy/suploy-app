Feature: Manage webapps
  In order to get an overview of my apps
  As a regular user
  I want to show all apps I uploaded

  Scenario: List all containers
    Given I am logged in
    When I am on the app list
    Then I see "Running containers"

  Scenario: Stop web app
    Given I am logged in
    And there is at least one running app
    When I am on the manage containers page
    And I click "Stop webapp"
    Then I see a "stopped webapp" notification

  Scenario: Start a webapp
    Given I am logged in
    And there is a stopped app
    When I am on the manage containers page
    And I click "start webapp"
    Then I see a "started webapp" notification

