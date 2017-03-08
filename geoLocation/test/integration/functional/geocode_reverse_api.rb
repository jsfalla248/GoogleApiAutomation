# Test Name : Reverse Geolocation API Tests
# Description: Reverse Geolocation API Tests
# Author: Salima Allarakhia
#####################################################################################
# Test Cases: (5)                                            Status:                #
#    - Reverse Geolocaiton API valid request                200, OK                 #
#    - Reverse Geolocaiton API invalid latlng               200, ZERO_RESULTS       #
#    - Reverse Geolocaiton API invalid API key              200, OK                 #
#    - Reverse Geolocaiton API invalid request              400, INVALID_REQUEST    #
#    - Reverse Geolocaiton API valid xml                    200, OK                 #
##################################################################################### 



require 'minitest/autorun'
require 'rest-client'
require 'json'



class APITest < MiniTest::Test
   # Validation of Reverse Geolocation with valid request
   def test_reverse_geocode_api_json_response
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body
          #print @data
          #Extract the 'status' from response body
          assert_equal 'OK', @data['status']
        
    end

  


 # Validaiton of Reverse Geolocation, valid request invalid values for LatLng       
  def test_reverse_geocode_api_invalid_latlng
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?latlng=0,-0&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body 
          assert_equal "ZERO_RESULTS", @data["status"]  
         
    end

# Validation of Reverse GeoLocation with invalid API Key = Nil
  def test_reverse_geocode_api_validate_invalid_key
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key='
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body 
          # Data validation based address provided in POST API call
          assert_equal "OK", @data["status"]  
         
        
    end


# Validation of Reverse Geolocation with a Invalid request, Null values latlng
# This is a valid test, needs exception handling
   def skip_test_reverse_geocode_api_invalid_request
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 400
          assert_equal response.code, 400
          @data = JSON.parse response.body 
          assert_equal "INVALID_REQUEST", @data["status"]
          
   end


# Validation of Reverse Geolocation with xml request
   def test_reverse_geocode_api_xml_request
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/xml?latlng=40.714224,-73.961452&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 200
          assert_equal response.code, 200
          
          
   end

end