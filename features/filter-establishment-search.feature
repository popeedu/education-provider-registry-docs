@search-filter
Feature: FilterEstablishmentSearch
As a public website visitor
I want to filter search results by establishment details
So that I can further refine the establishments to meet my needs

@search-filter-establishment-type
Background:
Given the following establishments have been created:
  | Establishment Name                             | Establishment Type          |
  | Perran-Ar-Worthal Community Primary School     | Community school            |
  | Freezywater St George's CofE VA Primary School | Voluntary aided school      |
  | Robert Wilkinson Primary School                | Academy converter           |
  | Bluebell Park School                           | Community special school    |
  | The Shirestone Academy                         | Academy sponsor led         |
  | St John's CofE Primary School                  | Academy converter           |
  | Redgate Community Primary School               | Community school            |
  | Harbury CofE Primary School                    | Voluntary controlled school |
  | St Aidan's Church of England Academy           | Academy sponsor led         |
  | Dhahran British Grammar School                 | British schools overseas    |

Scenario: Establishment type filters show types in the search results
When a search is made using the term "school"
And the search results are displayed
Then the establishment types that can be filtered on are:
  | Establishment Type         |
  | Academy converter          |
  | Community school           |
  | British schools overseas   |
  | Community special school   |
  | Voluntary aided school     |
  | Voluntary controlled school|

Scenario: Changing the search term updates the establishment filters
Given a search has been made using the term "school"
When the search is changed to use the term "community"
And the search results are displayed
Then the establishment types that can be filtered on are:
  | Establishment Type |
  | Community school   |

Scenario: Selecting a single establishment type returns all establishments matching the type
Given a search has been made using the term "school"
When the establishment type is set to "British schools overseas"
And the search results are displayed
Then the establishments returned in the search are:
  | Establishment Name             |
  | Dhahran British Grammar School |

Scenario: Selecting multiple establishment types returns all establishments matching the types
Given a search has been made using the term "school"
When the establishment types are set to:
  | Establishment Type       |
  | British schools overseas |
  | Academy converter        |
And the search results are displayed
Then the establishments returned in the search are:
  | Establishment Name              |
  | Dhahran British Grammar School  |
  | Robert Wilkinson Primary School |
  | St John's CofE Primary School   |


@search-filter-establishment-status
Background:
Given the following establishments have been created

| Establishment Name              | Establishment Status           |
| Shacklewell Primary School      | Proposed to open               |
| Eleanor Palmer Primary School   | Closed                         |
| Brookfield Primary School       | Open                           |
| Argyle Primary School           | Open                           |
| The Future Tech Studio          | Open, but proposed to close    |
| Beckford Primary School         | Open                           |
| Brecknock Primary School        | Open                           |
| Kingsgate Infant School         | Closed                         |
| Torriano Infant School          | Closed                         |
| Kingsgate Junior School         | Closed                         |

Scenario: Establishment status filters show available statuses in the search results
When a search is made using the term "school"
And the search results are displayed
Then the establishment statuses that can be filtered on are:
| Establishment Status |
| Closed              |
| Open                |
| Proposed to open    |

Scenario: Changing the search term updates the establishment status filters
Given a search has been made using the term "school"
When the search is changed to use the term "Studio"
And the search results are displayed
Then the establishment statuses that can be filtered on are:
| Establishment Status         |
| Open, but proposed to close |

Scenario: Selecting a single establishment status returns matching establishments
Given a search has been made using the term "school"
When the establishment status is set to "Closed"
And the search results are displayed
Then the establishments returned in the search are:
| Establishment Name            |
| Eleanor Palmer Primary School |
| Kingsgate Infant School       |
| Kingsgate Junior School       |
| Torriano Infant School        |

Scenario: Selecting multiple establishment statuses returns matching establishments
Given a search has been made using the term "school"
When the establishment statuses are set to "Closed" and "Open, but proposed to close"
And the search results are displayed
Then the establishments returned in the search are:
| Establishment Name            |
| Abbotsford Preparatory School |
| Eleanor Palmer Primary School |
| Kingsgate Infant School       |
| Kingsgate Junior School       |
| Torriano Infant School        |
