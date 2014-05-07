Feature: Manage webapps
  In order to get an overview of my apps
  As a regular user
  I want to show all apps I uploaded

  Background:
    Given a test user exists

  Scenario: List all containers
    Given I am logged in
    When I am on the app list
    Then I should see "Manage Apps"
