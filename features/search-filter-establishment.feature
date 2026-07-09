@search-filter
Feature: FilterEstablishmentSearch
  As a public website visitor
  I want to filter search results by establishment details
So that I can further refine the establishments to meet my needs

@search-filter-status
Scenario: Filter establishments on status
Given the following establishments exist:
    | Establishment Name         | Establishment Status          |
    | Oakley Vale Primary School | Closed                        |
    | King Ethelbert School      | Open                          |
    | Cornerstone School         | Pending approval              |
    | Open Arms School           | Proposed to open              |
    | The Future Tech School     | Open, but proposed to close   |
And search results have been returned
When  search is made using the term "<term>"
And the search is filtered to include "<statuses>"
And the search is resubmitted
Then "<results count>" establishments are returned in the search
  | Example                         | Term    | Status        | Result Count |
  | All statuses with search term   | school  | All           | 4            |
  | All statuses with no search term|         | all           | 4            |
  | One status with search term     | school  | Closed        | 1            |
  | Multiple search terms           | school  | Open, Closed  | 2            |
  | No match                        | College | All           | 0            |
