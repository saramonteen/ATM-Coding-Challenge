# README

## Required to run this:
- Ruby version 2+
- Rails version 6+
- Postman

## Ruby Install
### Follow this link to download Ruby+Devkit 2.7.2-1 (x64) for windows.
https://rubyinstaller.org/downloads/

## Rails Install
### Run the command
> `gem install rails`
### in the terminal in the same folder you installed Ruby.

## Postman Install
https://www.postman.com/downloads/

## How to run:
1. Download my project into a folder of your choice in the same root that you did the ruby and rails installs in.
2. Open the terminal and cd into the project folder.
3. Run the command: `rails s`
4. Note the port the project is running on.
5. Open postman.
6. Create a GET request put the following line into the url bar:
**localhost:your-port/getGeo/ip address**
7. Then populate the ip address area of the url with any ip address of your choosing and hit enter.
Here is a helpful generator: https://www.ipvoid.com/random-ip/
8. You will see the ip address you entered and its corresponding city and country data if it was available.
9. After putting in few different ip addresses open a new GET request tab.
10. In the new tab put the following line into the url bar:
**localhost:your-port/getCache**
11. Upon hitting enter you will see all of the ip addresses and corresponding information that you submitted.
12. If you wish to filter the ip addresses by city or country search in the url the following way:
- **localhost:your-port/getCache?city=San Diego**
- **localhost:your-port/getCache?country=United States**

