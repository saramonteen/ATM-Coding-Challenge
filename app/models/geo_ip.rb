class GeoIp < ApplicationRecord
    def initialize(ip, city, country)
        @ip = ip
        @city = city
        @country = country
    end
end
