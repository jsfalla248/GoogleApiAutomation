# Name : Production Test Suite  API Tests
# Description: Reverse Geolocation API Tests
# Author: Salima Allarakhia
# Production Test Suite (Authentication & Functional)
#########################################################



require 'minitest/autorun'
require 'rest-client'
require 'json'
#require 'minitest-reporters'

class APITest < MiniTest::Test
   def test_geocode_api_auth_valid_key
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body
         #print @data
          #Extract the 'status' from response body
          assert_equal 'OK', @data['status']
        
    end

   def test_geocode_api_auth_invalid_key
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body
          #print @data
          #Extract the 'status' from response body
          assert_equal 'REQUEST_DENIED', @data['status']
    end

   def test_geocode_api_auth_auth_bad_key
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=1234'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body
          #print @data
          #Extract the 'status' from response body
          assert_equal 'REQUEST_DENIED', @data['status']
    end

  def test_geocode_api_auth_auth_no_key
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key='
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body
          #print @data
          #Extract the 'status' from response body
          assert_equal 'OK', @data['status']
    end

  def test_geocode_api_auth_http_with_valid_key
          response = RestClient.get 'http://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body
          #print @data
          #Extract the 'status' from response body
          assert_equal 'REQUEST_DENIED', @data['status']
          # Note: assert Raise exception - This might have been done using assert Raise
          #assert_raise 'Requests to this API must be over SSL. Load the API with \"https://\" instead of \"http://\\"."', @data['error_message']
 
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

# Functional Tests

   def test_geocode_api_validate_json
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          @data = JSON.parse response.body
          #print @data
          #Extract the 'status' from response body
          assert_equal 'OK', @data['status']
        
    end

   def test_geocode_api_validate_xml
          response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/xml?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyD8-YaLb0jBegWwfeUVDtDa52zz58D2th8'
          #Ensure the API return 200 OK
          assert_equal response.code, 200
          
   end

end

