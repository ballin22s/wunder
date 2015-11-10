== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	ruby 2.2.2p95 

* System dependencies

* Configuration

* Database creation
	mysql2
	In terminal do, or the command to start mysql environment
	mysql -u root -p

	create both testing and development database
	create database wunder_development;
	create database wunder_test;
	
	change config/database.yml
	username & password to your username and password. 

* Database initialization
	bundle install
	bundle exec rake db:migrate (run all migrations)
	bundle exec rake db:seed (seed the database with seeds.rb)

* How to run the test suite
  	bundle exec rake test

* Deployment instructions


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
