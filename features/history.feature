Feature: List all questionaire done by user
  In order to list all questionaire done by user
  As an user
  I want to see the history of what i have done

  Background:
	Given the following history
	|date|blue_value|
	|19-05-11|10|
	|18-06-11|20|
	|20-06-11|19|

  Scenario: History List
  When I go to the history of what user have done
  Then I should see "Date"
  
  Scenario: Date history details
  When I go to any date
  Then I should see the full history of what user have done
