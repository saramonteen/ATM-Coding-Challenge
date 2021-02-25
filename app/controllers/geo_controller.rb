require 'json'

class GeoController < ApplicationController

    #Collects data from GeoJS with user provided parameter and then puts specific data into the cache
    def getGeo
        #Creates variable 'response' and sets it to GeoJs uri with needed user provided parameter
        response = Faraday.get 'https://get.geojs.io/v1/ip/geo/' + params[:ip] + '.json'
        
        #Creates variable 'ip' and sets it to the user provided parameter
        ip = params[:ip]

        #Checks if the response for the country field contains a value and assigns the correct value to the variable country
        if JSON.parse(response.body).key?('country')
            country = JSON.parse(response.body).fetch('country')
        else
            country = ""
        end

        #Checks if the response for the city field contains a value and assigns the correct value to the variable city
        if JSON.parse(response.body).key?('city')
            city = JSON.parse(response.body).fetch('city')
        else
            city = ""
        end

        #Fetch writes and reads the values into the cache in the specifed json format  
        #Fetch only reads and writes once: meaning that if you input a new ip address and 
            #then submit the same ip address again null will print because it read that the 
            #submitted ip address is already in the cache
        Rails.cache.fetch("#{ip}/ip_cache", expires_in: 24.hours) do
            @geo = { "ip" => ip, "city" => city, "country" => country }  
        end
    end

    #Displays the user inputted ip adresses and the corresponding city and country data
    #Also filters data by city or country per user parameters
    def getCache
        keys = Rails.cache.instance_variable_get(:@data).keys
        data = [keys.length]

        #If a city parameter is detected and it matches data in the city field in the cache then 
            #that city and its corresponding ip address and country are pushed onto the array
        if params["city"]
            city = params["city"]
            keys.each do |key|
                curr = Rails.cache.read(key)
                if curr["city"] == city
                    data.push(Rails.cache.read(key))
                end
            end
        #If a country parameter is detected and it matches data in the country field in the cache then 
            #that country and its corresponding ip address and city are pushed onto the array
        elsif params["country"]
            city = params["country"]
            keys.each do |key|
                curr = Rails.cache.read(key)
                if curr["country"] == city
                    data.push(Rails.cache.read(key))
                end
            end
        #If no parameters are detected then push cache onto array
        else
            keys.each do |key|
                data.push(Rails.cache.read(key))
            end
        end

        @cache = data
        
    end
end
