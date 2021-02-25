# README

Required to run this:
Ruby
Rails
Postman

Ruby Install
Follow this link to download Ruby+Devkit 2.7.2-1 (x64) for windows.
https://rubyinstaller.org/downloads/

Rails Install
Run the command
gem install rails
in the terminal in the same folder you installed Ruby.

Postman Install
https://www.postman.com/downloads/


Download my project into a folder of your choice in the same root that you did the ruby and rails installs in.
Open the terminal and cd into the project folder.
Run the command:
rails s
Note the port the project is running on.
Open postman.
Create a GET request put the following line into the url bar:
localhost:3000/getGeo/ip address
Then populate the ip address area of the url with any ip address of your choosing and hit enter.
Here is a helpful generator: https://www.ipvoid.com/random-ip/
You will see the ip address you entered and its corresponding city and country data if it was available.
After putting in few different ip addresses open a new GET request tab.
In the new tab put the following line into the url bar:
localhost:3000/getCache
Upon hitting enter you will see all of the ip addresses and corresponding information that you submitted.
If you wish to filter the ip addresses by city or country search in the url the following way:
localhost:3000/getCache?city=San Diego
or
localhost:3000/getCache?country=United States

