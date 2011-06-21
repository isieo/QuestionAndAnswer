Feature: Display Questions Result
  In order to display the result after the questionaire
  As an user
  I want to display the result to user the result of the questionaire

  Scenario: Questionaire multiple result choosing
  When I go to the result of questionaire
  Then I should see "Graph Result"
  And I should see "Color Graph 
  And I should see "Traits"
  And I should see "Typical Work Type"

  Scenario: Selective Result Graph
  When I go to the Graph Result
  Then I should see the frame for Graph Result
  
  Scenario: Selective Result Color
  When I go to the Color Result
  Then I should see the frame for Color Result
  
  Scenario: Selective Result Traits
  When I go to the Traits Result
  Then I should see the frame for Traits Result
  
  Scenario: Selective Result Work Type
  When I go to the Work Type Result
  Then I should see the frame for Work Type Result
