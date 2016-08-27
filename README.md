# Employee MVP
The best way to give kudos to all your favorite coworkers.

## Getting Started

### Prerequisites
You will need a few things installed before you are able to run this app.

1.  Ruby 2.3.1 
2.  PostgreSQL 9.0 or later

### Setup
1.  Grab the code
`git clone git@github.com:dynamotechnologies/employee-mvp.git`

2.  Setup the database
```
# ensure that the database.yml reflects your username and password to your database, specifically the development profile if you are developing
rake db:create
rake db:migrate
rake db:seed
```

### Tests
This project uses rspec, so to run the test suite, just run 
`rspec`

### Running the server
```
rails server
# then go to http://localhost:3000
```
