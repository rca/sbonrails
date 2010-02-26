# SBonRails

This is the source code for the Santa Barbara Rails Group website, [sbonrails.com](http://sbonrails.com).


## Getting up and running

### Requirements

sbonrails is built and managed primarily the following:

 * Ruby 1.8.x
 * Rubygems 1.3.5
 * Ruby on Rails 2.3.5
 * MySQL
 * git

### Gem Requirements
  * compass
  * haml
  * thoughtbot-shoulda
  * factory_girl
  * clearance
  * cucumber-rails
  * database_cleaner
  * webrat

### Initial setup

Before anything else, change into the newly created `sbonrails` directory.

    cd sbonrails

We need to make sure all the gem dependencies are installed:

    rake gems:install
    rake gems:install RAILS_ENV=test

Now we need to create an initial database. We currently assume you have MySQL installed, and that you can login as 'root' without a password.

    rake db:create

Next migrate the database to the latest version:

    rake db:migrate

At last, we can run the server:

    script/server

This will keep running until you hit Control-C, but now you can open a browser and go to http://localhost:3000 to see the app running.

## Testing

We are using shoulda & cucumber for our testing. Before running them, you need to run the following to create the test database:

    rake db:create RAILS_ENV=test

At this point, you can run them with:

    rake test

We are also using cucumber for user stories / integration testing. You can run them with:

    rake features


## Contributing

You should go through the steps lined out in 'Getting up and running'.

To contribute, you should fork on GitHub, make your changes, and then either comment on an existing issue pointing at your changes, or create a new issue if it's a new bug or feature.

## Contributors

Design by Joshua Carver.

