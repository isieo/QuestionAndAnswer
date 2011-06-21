Feature: Display Questions
  In order to display questions
  As an user
  I want to display a set of question to user

  Background:
	Given the following question
	|name|description|
	|Think Rationally|calm to think|
	|Good With Numbers|mathematical|
	|Quiet|Silent|

  Scenario: Question List
  When I go to the list of question
  Then I should see "Think Rationally"
  And I should see "Good With Numbers" 
