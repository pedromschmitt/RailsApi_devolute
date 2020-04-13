# README

## To run the server

Install ruby 2.6.5, Rails 6.0.1 and Bundler 2.0.2

**Create database:**
```
bundle exec rails db:create db:migrate
```
(Edit database.yml before if you have a especific user/password)

**Run RSPEC to see tests passing:**
```
bundle exec rspec
```
(Edit database.yml before if you have a especific user/password)

**Then run server at port 3001, so React client can connect:**
```
bundle exec rails server -p 3001  
```