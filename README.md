## Getting Started

Install ruby 2.1.7 !
Dependencies on project does not work with 2.2.3

#### For windows users only
    
    Install ruby devkit. Dependencies require this as well. Initialize devkit as show on website.

Install bundler

    gem install bundler

Clone this repository and bundle.

    git clone <repository-url>
    cd datamie
    bundle install

Copy the database scripts from google drive

    https://drive.google.com/drive/folders/0Bw3XzzDAKz4WN0JZR013MGp5WVk
    
Open mySQL, Create datamie database

    CREATE DATABASE datamie

Go to Users and Privileges > Add Account

    Login Name: datamie
    Authentication Type: standard
    Limit to hosts matching: localhost
    Password : <blank>
Schema Privileges > Add Entry > datamie
Select All, tick GRANT OPTION as well.
Apply

Open new Query, Run datamie_table.sql, followed by datamie_entries.sql
Ensure that table is populated.

Start the application server.

    bin/rails server

Run the following to generate db/schema.rb

    rake db:schema:dump

Access the application at [http://localhost:3000/](http://localhost:3000/).

#### Technical Details
For some strange reason we are not using model.
Lets see if we can do something about it at the controller level...
