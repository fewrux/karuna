# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'
require 'faker'
puts "Cleaning database"
Booking.destroy_all
Project.destroy_all
User.destroy_all
Organization.destroy_all

user = User.new(first_name:"Ana", last_name: "Brasil", email:"ana@lewagon.com", password:"123445", age:30, gender:"feminino", document:"09334", country:"Brasil")
user.save!

puts "Created female user"

user_male = User.new(first_name:"Mark", last_name:"Cooper", email:"mark@lewagon.com", password:"123445", age:40, gender:"masculino", document: "013344", country: "France")
user_male.save!

puts "Created male user"

organization = Organization.new(name:"Company", email: "company@company.com", password:"123445", address: "Rua Visconde de Piraja, 300, Rio de Janeiro", country: "Brasil", website: "www.company.com")
organization.save!

puts "Created organization"

# create random projects using faker
continents = %w[Africa Asia North\ America South\ America Europe Oceania Middle\ East]
categories = %w[Agriculture Animal\ Rescue Construction Education Environmental Relief\ Effort Sanitation Water\ Access]
projects = []
10.times do
  project = Project.new
  project.name = Faker::Mountain.range
  project.description = Faker::Quote.jack_handey
  project.category = categories.sample
  project.continent = continents.sample
  project.address = Faker::Address.street_address
  project.city = Faker::Address.city
  project.available_spots = rand(5..50)
  project.start_date = Faker::Date.between(from: '2021-01-21', to: '2024-12-12')
  project.end_date = project.start_date + rand(7..365)
  project.organization = organization
  project.save!
  projects << project
end

puts "Created project"

first_booking = Booking.new(start_date:Date.new(2001,2,3), end_date:Date.new(2001,2,3), user: user, project: projects.first)
second_booking = Booking.new(start_date:Date.new(2002,2,3), end_date:Date.new(2002,2,3), user: user, project: projects.first)
third_booking = Booking.new(start_date:Date.new(2003,2,3), end_date:Date.new(2003,2,3), user: user, project: projects.first)
first_booking.save!
second_booking.save!
third_booking.save!

puts "Created booking"

puts "Finished"
