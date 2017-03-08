
# API Automation Endpoint Testing Practical
REST Api automation test cases consuming Google's GeoLocation Service API, including Reverse GeoLocation.

# Geting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.  See deployment for notes on how to deploy the project.

# Pre-Requisites
## Base Installation Requirements:
    * Ruby Version 2.4.0
         * To obtain Ruby version: ruby -v
    * Rails Version 5.0.2
         * To obtain Rails version: rails -v

# Update Gems
## Base Gem Installtion Requirements:
   * gem install rest-client
   * gem install json
   * gem install minittest
   
# Clone Repository 
   * Clone GoogleApiAutomation Repository

# Running Tests
   * After the project has been downloaded, the code can be excuted in the following two ways:
      *  Run test locally from term window
      *  Run tests from command prompt
      # Command: ruby api_authentication.rb
      
# Test Cases
   * geolocation/test/integration/authentication/api_authentication.rb
   * geolocation/test/integration/functional/geocode_api_functional.rb
   * geolocation/test/integration/functional/geocode_reverse_api.rb
   * geolocation/test/integration/functional/prodSuite/prodSuite.rb

# Test Case Descriptions
* api_authentication.rb: API unittests using mini test that will validate response codes, and status of the geolocation api's
* geocode_api_functional.rb: API unittest using mini test that will validate response codes, status and data validation of geolocation api's
* geocode_reverse.api.rb: API unittest using mini test that will validate response codes, status and data validation of the reverse geolocation api's 
* prodSuite.rb: API unittest using mini test that can be setup to run against a production host. The tests are combination of authentication and functional tests that will provide a "mini smoke test" of the Google Geolocation api's.

# Deployment
* Deployment locally is managed thru git clone
* Deployment and setup in prod environment will also include git clone, but a cron job will need to be setup to execute the tests hourly to ensure update and integrity of the geolocation api's.

# Built With:
* The tests were build with Ruby Rails project structure by defining a new project within rails.

# Author:
* Salima Allarakhia

#Acknowledgements:
* http://docs.seattlerb.org/minitest


   

 

