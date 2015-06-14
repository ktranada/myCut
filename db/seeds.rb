# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create!(username: "guest", email: 'guest@gmail.com' , password: 'password')
user2 = User.create!(username: "kevin", email: 'kevin@gmail.com' , password: 'password')
user3 = User.create!(username: "lana", email: 'lana@gmail.com', password: 'password')
user4 = User.create!(username: "danny", email: 'danny@gmail.com', password: 'password')
user5 = User.create!(username: "vicky", email: 'vicky@gmail.com', password: 'password')


shop1 = Shop.create!(moderator_id: 1,
                     name: "Slick and Dapper Barber Shop",
                     address: "3619 Grand Ave",
                     city: "Oakland",
                     state: "California",
                     zip: "94610",
                     phone: 5102510796,
                     rating: 4.5,
                     tag_list: ["fades, slick, dapper, retro"],
                     location_list: ["oakland, east bay, 94610"])



shop2 = Shop.create!(moderator_id: 1,
                      name: "Station 33 Barber Shop",
                      address: "440 Grand Ave",
                      city: "Oakland",
                      state: "California",
                      zip: "94610",
                      phone: 9255777315,
                      rating: 5,
                      tag_list: ["Barber, Barber Shop, retro, fade"],
                      location_list: ["oakland, east bay, 94610"])


shop3 = Shop.create!(moderator_id: 1,
                     name: "Barber Tim Piper",
                     address: "936 Clay St",
                     city: "Oakland",
                     state: "California",
                     zip: "94607",
                     phone: 5103815330,
                     rating: 5,
                     tag_list: ["barber shop, taper, taper"],
                     location_list: ["oakland, east bay, 94607"])

shop4 = Shop.create!(moderator_id: 1,
                      name: "Charles Blades Barber Spap",
                      address: "180 2nd St",
                      city: "Oakland",
                      state: "California",
                      zip: "94607",
                      phone: 5108348330,
                      rating: 5,
                      tag_list: ["Throwback, taper, color"],
                      location_list: ["oakland, east bay, 94607, thug mansion"])

Barber.create!(shop_id: 1, name: "Butters DeSilva", rating: 5)
Barber.create!(shop_id: 1, name: "Harry Potter", rating: 4.5)
Barber.create!(shop_id: 1, name: "Danny 'Fighter' O'Doyle", rating: 3)
Barber.create!(shop_id: 2, name: "Stella Artois", rating: 4)
Barber.create!(shop_id: 3, name: "Rocky Balfoa", rating: 3)
Barber.create!(shop_id: 4, name: "Stella Rosa", rating: 2)
Barber.create!(shop_id: 4, name: "Hoppy Poppy", rating: 4)
Barber.create!(shop_id: 2, name: "Mei Knottgood", rating: 1)

Review.create!(author_id: 2, body: "Butters was great. Would get another cut by him", shop_id: 1, rating: 5)
Review.create!(author_id: 3, body: "Harry was aiite.", shop_id: 1, rating: 4)
Review.create!(author_id: 2, body: "Stella +1", shop_id: 2, rating: 5)
Review.create!(author_id: 1, body: "Hoppy poppy was fire.", shop_id: 4, rating: 4)
