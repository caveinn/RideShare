[![Build Status](https://travis-ci.org/caveinn/RideShare.svg?branch=develop)](https://travis-ci.org/caveinn/RideShare)  

# RideShare
 
 This is a ruby application that allows for car pooling
for users. It works by allowing  users to offer rides from their 
origin to their destination and then having those in need of the 
rides requesting to join in on the ride.

**Technologies Used**

For the application the following technologies are used
- Rails - a ruby framework that allows for easier development of web application
- Postgres - a database management system that is easily scalable
- Bootstrap - a css framework that makes styling of the website easier
- Jquery -  A javascript framework that is requoired for bootstrap to work efficatively

**How to set up the application**

- clone to your local machinne by using the command `git clone https:/github.com/caveinn/RideShare.git`
- cd into the RideShare directory using `cd RideShare`
- install the required gems by running `bundle`
- create the relevant database by running `rake db:migrate`
- run the migrations by running `rake db:migrate`
- start the server by running `bin/rails s`

**To run the tests**
- to create the test db run `rake db:create RACK_ENV=test`
- to run the migrations on the test db run `rake db:migrate RACK_ENV=test`
- run the tests  by running `rspec`
