# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.

 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.

 # The `save` method then saves this User to the database.

#Create Registered_Applications
10.times do
  RegisteredApplication.create!(
    user:     users.sample,
    url:      Faker::Internet.domain_name,
    title:    Faker::App.name
    )
end
registered_applications = RegisteredApplication.all

#Create Events
100.times do
  Event.create!(
    name:     Faker::Hacker.verb,
    registered_application: registered_applications.sample
    )
end
events = Event.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'ckib16@gmail.com',
  name:  'Chris Kibble',
  password: 'testtest'
  )

puts "Database seeding finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered_applications created"
puts "#{Event.count} events created"
puts
puts "The first User name is: #{user.name}"
puts "The first User email is: #{user.email}"
puts "The first User password is: #{user.password}"
