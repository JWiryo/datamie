#### TODO LIST
1. User Signup + ~~SignIn~~ + SignOut (James)
2. Database Maintenance + Convert to BCNF (Luccan)
3. Rating and Helpfulness implementation (Kat)
4. Front-End Bootstrap (Ivan)
5. Ordering of Indomies
6. Browsing of Indomies
7. Admin Page + Statistics
8. Report (Janice)

## Getting Started

Install ruby 2.1.7 !
Dependencies on project does not work with 2.2.3

#### For windows users only

    Install ruby devkit. Dependencies require this as well. Initialize devkit as shown on website.
    Install nodejs to resolve ruby issue.

Install bundler

    gem install bundler

Clone this repository and bundle.

    git clone <repository-url>
    cd datamie
    bundle install

Copy the database scripts from the folder datamie/SQLQueries

Open mySQL, make sure your connection has the following configuration.

    Hostname: 127.0.0.1
    Port: 3306
    Username: root
    Password: <leave blank>

Create datamie database

    CREATE DATABASE datamie;

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

    ./bin/rails server

Access the application at [http://localhost:3000/](http://localhost:3000/).

#### Technical Details
------
For some strange reason we are not using model.
Lets see if we can do something about it at the controller level...

#### Resources
------
http://rogerdudler.github.io/git-guide/
http://www.rubydoc.info/gems/mysql2/0.2.3/frames
http://guides.rubyonrails.org/getting_started.html
http://stackoverflow.com/questions/13145696/ruby-on-rails-add-a-new-route
