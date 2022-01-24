# Marios specialty Products.

#### By Isaac Overstreet


## Description
_An app used to record products and their reviews for customers to view. As well as the option to be an Admin or not._

## Technologies Used
* _Ruby_
* _Capybara_
* _rspec_
* _pry_
* _Docker_
* _Rails_
* _PostgreSQL_
* _Shoulda Matchers_
* _Faker_
* _Active Record_
* _Devise_

## Using this app:

* _Run_ `git clone https://github.com/mrunderoad/mariofood` _in your terminal to clone this repo onto your device, then navigate to the project._
* _Run_ `bundle install` _to package the Gems_
* _Run_ `rake db:setup` _to set up the database_._
* _Run_ `rspec` _to run spec tests_
* _Run_ `rails s` _to start a local server._
* _Open up your web browser and go to_ `http://localhost:3000` _while the server is running to view project._

## Using this app with Docker

* _Run_ `git clone https://github.com/mrunderoad/mariofood` _in your terminal to clone this repo onto your device, then navigate to the project._
* _Run_ `docker-compose run web bundle install` _to bundle the gems_
* _Run_ `docker-compose run web sh` _to start a shell inside the container._
* _Run_ `rake db:setup` _in the container shell to set up the database_
* _Run_ `rspec` _to view spec tests_
* _In your normal terminal, run_ `docker-compose up --build` _to bundle and build app._
* _Open up your web browser and go to_ `http://localhost:3000` _while the server is running to view the project._

## Known Bugs
* _None so far._

## License - [MIT](https://opensource.org/licenses/MIT)

Copyright (c) _2022_ _Isaac O_
