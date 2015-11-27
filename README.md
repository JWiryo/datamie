## Getting Started

Install ruby 2.1.7! Dependencies on project does not work with 2.2.3

Clone this repository and bundle.

    git clone <repository-url>
    cd datamie
    bundle install

Create and initialize the database.

    rake db:create
    rake db:migrate

Start the application server.

    bin/rails server

Access the application at [http://localhost:3000/](http://localhost:3000/).
