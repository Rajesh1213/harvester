# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

```
    $ cd harvest
    $ bundle install
```

1. configure app/config/database.yml
2. I am using Postgresql. update Gemfile to support your database with suitable gem.


```
    $ rake db:create
    $ rake db:migrate
```
* Once the migrations are done start the rails server

```
    $ rails s

```
The application should be up and running on http://localhost:3000
Thanks!
