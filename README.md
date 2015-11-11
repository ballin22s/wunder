== README

Wunder Project
by: Sergio Pedroza

This is a small shopping cart application using Ruby On Rails.

Things you may want to cover:

Rails version

	rails 4.2.4
	
Ruby version

	ruby 2.2.2p95 

Database creation
	
	gem mysql2
	
	In Terminal Run (Or your command to start mysql environment)
	mysql -u root -p

	create both testing and development database
	create database wunder_development;
	create database wunder_test;
	
	change config/database.yml
	username & password to your username and password. 

Database initialization

	In Terminal Run
	bundle install
	
	bundle exec rake db:migrate (run all migrations)
	bundle exec rake db:seed (seed the database with seeds.rb)

How to run the test suite

  	bundle exec rake test