@search
Feature: PaginateEstablishments
As a public website visitor
I want establishment search results to be paginated
So that the results are structured and more easily reviewed

@paginate-establishments-result-count
Scenario: Search results are paginated into batches of up to 10 establishments
 Given a user performs a search for establishments
  And the search returns <totalResults> matching establishments
  Then <intialResults> establishments are visible
  And <totalResultsBatches> of results exist

| Example              | totalResults | intialResults | totalResultsBatches |
| Less than 10 results | 5            | 5             | 1                   |
| 10 results returned  | 10           | 10            | 1                   |
| >10 results returned | 11           | 10            | 2                   |
| >20 results returned | 25           | 10            | 3                   |


@paginate-establishments-navigate
Scenario: Navigating between pages returns the correct number of establishments
Given a search returns <totalResults> matching establishments
  And the results are ordered consistently
  When batch <resultsBatch> is requested
  Then <resultsReturned> establishments are returned
  And no establishment is duplicated in another batch
  And no matching establishment is omitted

  | totalResults | resultsBatch | resultsReturned |
  | 25           | 1            | 10              |
  | 25           | 2            | 10              |
  | 25           | 3            | 5               |
  | 20           | 2            | 10              |

@paginate-establishments-next-previous
Scenario: Previous and next batches can be accessed correctly
 Given a search returns <totalResults> matching establishments
  And the user is viewing the <position> batch of results
  Then access to previous batch is <previousAvailable>
  And access to next batch is <nextAvailable>

Examples:
  | position | previousAvailable | nextAvailable |
  | first    | unavailable       | available     |
  | middle   | available         | available     |
  | final    | available         | unavailable   |

