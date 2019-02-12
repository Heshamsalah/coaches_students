# Coaches And Students App  -- API Only APP

* rails version: **Rails 5.2.2**
* ruby version: **ruby 2.5.1p57**

* The App provides both RESTful API and GraphQL. 
* This is an API only app, but you can find the front end app in **[here](https://github.com/Heshamsalah/coaches_and_students_web_app)** (*still under construction*).


* The app uses GraphiQL lib to interact with the backend through a GUI. [`gem 'graphiql-rails'`](https://github.com/rmosolgo/graphiql-rails)
* You can run it using: `http://localhost:3000/graphiql`

## Instructions

- clone the repo `https://github.com/Heshamsalah/coaches_students.git`
- run `bundle install`
- run `rails db:create; rails db:migrate; rails db:seed`
- run `rails s` -- you might need to spicify a port if you are going to run it along side the react app
- use this cmd to run it with the default configs for the front end app `rails s -p 5000`


## Tests
- Tests are written useing `RSpec`
- run `rspec` to run all tests. *graphql tests are not added yet*


## Styling 
- This repo uses `rubocop` to run code style checks
