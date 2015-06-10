# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create!(email: 'guest@gmail.com' , password: 'password')
user2 = User.create!(email: 'kevin@gmail.com' , password: 'password')
user3 = User.create!(email: 'lana@gmail.com', password: 'password')
user4 = User.create!(email: 'danny@gmail.com', password: 'password')
user5 = User.create!(email: 'vicky@gmail.com', password: 'password')
