Feature:

    I would like to provide a solution to test weather API's
    Weather Api returns result when queried with a city Name


	Scenario Outline: Valid Response

		Given I have entered "weather" as endpoint

		And I have also entered <city> in the cityname

		When I call API

		Then the response should be <result>

        Examples: Example responses for cities
             | initial | city            | result |
             | 0       | Bangalore,in    | 200    |
             | 0       | London,uk       | 200    |
             | 0       | Delhi,in        | 200    |





    Scenario Outline: 404 response for invalid city name

	    Given I have entered "weather" as endpoint

		And I have also entered <city> in the cityname

		When I call API

		Then the response should be <result>

		And the response should contain <respons>

        Examples: Example responses for cities
             | initial | city            | result | response
             | 0       | mangal,in       | 404    | city not found
             | 0       | London,in       | 404    | city not found
             | 0       | in              | 404    | city not found





    Scenario Outline: 401 response for expired and invalid apikey's

	    Given I have entered "weather" as endpoint

		And I have also entered <city> in the cityname

		When I call API with the <apikey>

		Then the response should be <result>

		And the response should contain <response>

        Examples: Example responses for cities
             | apikey                                 | city            | result | response        |
             | 9978cf049e0c9a935aaa42d2ad22a5ec       | mangalore,in    | 401    | Invalid API key |
             | 0                                      | London,uk       | 401    | Invalid API key |