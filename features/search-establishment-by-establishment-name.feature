@search
Feature: SearchEstablishmentByName
  As a public website visitor
  I want to search for establishments by their name
  So that I can find information about establishments I am interested in

@search-name-no-results
Scenario: No Establishment results returned
  Given an establishment search has been made
  When no establishments match the search term
  Then an error is returned indicating no establishment were found

@search-name-multiple-results
Scenario: Some Establishment results returned
  Given an establishment search has been made
  When one or more establishment names match the search term
  Then the matching estbablishments are returned

@search-name-case-insensitive
Scenario Outline: Search is case insensitive
  Given an establishment named "Greenwood Academy" exists
  When the user searches for "<term>"
  Then the establishment "Greenwood Academy" is returned

  Examples: 
    | term       |
    | "greenwo"  |
    | "GrEENWo   |
    | "GREENWOO" |
    
@search-name-special-character
Scenario: Establishments with special characters in their name can be searched
  Given an establishment named "O'Brien Academy" exists
  When the user searches for "'"
  Then the establishment "O'Brien Academy" is returned

@search-name-space
Scenario: Establishments with spaces in their name can be searched
  Given an establishment named "Sutton Grammar" exists
  When the user searches for " "
  Then the establishment "Sutton Grammar" is returned

@search-name-status
Scenario: Exclude establishments based on status
Given the following establishments exist:
    | Establishment Name         | Establishment Status          |
    | Oakley Vale Primary School | Closed                        |
    | King Ethelbert School      | Open                          |
    | Cornerstone School         | Pending approval              |
    | Open Arms School           | Proposed to open              |
    | The Future Tech School     | Open, but proposed to close   |
When a search is made using the term "<term>"
And "<status>" establishments are included
Then "<results count>" establishments are returned in the search
  | Example                    | Term        | Status    | Result Count |
  | Only open establishments   | school      | only open | 2            |
  | All establishments         | school      | all       | 4            |
  | Non-exposed status - open  | Cornerstone | only open | 0            |
  | Non-exposed status - all   | Cornerstone | all       | 0            

