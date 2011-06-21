Feature: Display Questions Result
  In order to display the result after the questionaire
  As an user
  I want to display the result to user the result of the questionaire

  Background:
	Given the following questionaire reesult
	|name|description|
	|Think Rationally|calm to think|
	|Good With Numbers|mathematical|
	|Quiet|Silent|

  Scenario: Questionaire result
  When I go to the result of questionaire
  Then I should see "Graph Result"
  And I should see "Color Graph 
  And I should see "Traits"
  And I should see "Typical Work Type"
