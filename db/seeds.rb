# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require_relative 'yelp_seeds.rb'
User.destroy_all
Shop.destroy_all
Review.destroy_all
Barber.destroy_all

user1 = User.create!(username: "guest", email: 'guest@gmail.com' , password: 'password')
user2 = User.create!(username: "kevin", email: 'kevin@gmail.com' , password: 'password')
user3 = User.create!(username: "lana", email: 'lana@gmail.com', password: 'password')
user4 = User.create!(username: "danny", email: 'danny@gmail.com', password: 'password')
user5 = User.create!(username: "vicky", email: 'vicky@gmail.com', password: 'password')


######################################### Shop 1

# shop1 = Shop.create!(moderator_id: 1,
#              name: "PATRICK EVAN Hair Salon",
#              address: "55 Grant Avenue 4th Fl",
#              city: "San Francisco",
#              state: "CA",
#              zip: "94108",
#              phone: 4154211111,
#              rating: 0.0,
#              tag_list: ["women, womens, keratin treatment, japanese hair straightening, curly hair, extensions, straight perms, coloring, thermal reconditioning, womens haircut, women haircut"],
#              location_list: ["san francisco, union square, financial district"],
#              photo_url: "http://s3-media4.fl.yelpcdn.com/bphoto/rq3KWK5doz7Yltts1O2RnQ/o.jpg")
# barber_2 = Barber.create!(name: "Trevor", shop_id: shop1.id,  skill_list: ["coloring, keratin treatments"], photo_url: "http://s3-media2.fl.yelpcdn.com/bphoto/EGWxZatDc11tZosACS4qvA/o.jpg")
# barber_3 = Barber.create!(name: "Lauren", shop_id: shop1.id, skill_list: ["thermal reconditioning, coloring"])
# shop1_review_1 = shop1.reviews.create!(body: "This is the best salon experience I've ever had! From the start, Mary Ann (the receptionist, I believe) was super sweet and helpful. When I got there, I was warmly greeted by nearly everyone there. There was a bit of a miscommunication (I scheduled for a balayage but they had only listed me for a haircut). But my hair stylist, Britney, was accommodating and did the balayage anyway. The color turned out even better than I could've imagined. She was knowledgeable and really cool. The only negative thing was at the end when I was paying, another receptionist was helping me with my payment. I stood there for a while after I got my receipt, thinking there was a next step because she didn't say a word after. So after a few minutes of waiting at the desk, I asked, 'Am I all set?' and she just replied with yeah"  , author_id: 1, barber_id: barber_3.id, rating: 5)
# shop1_review_2 = shop1.reviews.create!(body: "I absolutely LOVE this salon! I have followed two of their greatest stylists (Olive and Kat) from a previous salon and their work continues to shine over anything else I've ever seen. The way both of these girls work their color magic keeps me coming back time and time again and I'm so happy that this place exists so that they can continue their awesome work. Both ladies are extremely warm and talented and ask if you'd like coffee or tea upon arrival and WILL NOT let you leave unless you're 100% satisfied with what they've done. As a woman, its hard to trust people with something as precious as your hair color, and I'm telling you - if you want the job done not just right and professionally - but with warmth and character - ask for them! Seriously cannot go wrong with what they do!
#
# Trevor works amazingly as well! All three people I would recommend over and over again!", author_id: 2, barber_id: barber_2.id, rating: 5 )
# shop1_review_3 = shop1.reviews.create!(body: "Lauren (and her assistant Haili) did an AMAZING job!! They darkened my hair near the roots, but just enough so that it still looked like a nutty brown overall. The ends are a perfect sombre and it is a BEAUTIFUL ashy brown (no brassiness, yay!)" , author_id: 3, barber_id: barber_3.id, rating: 5)
#
# shop1_review_1.pictures.create!(photo_url: "http://s3-media1.fl.yelpcdn.com/bphoto/bgOJhsbWVty9GDOx4j7gbw/o.jpg")
# shop1_review_2.pictures.create!(picture_comment: "loving my hair!", photo_url: "http://s3-media2.fl.yelpcdn.com/bphoto/osobIvmVOp4aHpS4dHPBEg/o.jpg")
# shop1_review_3.pictures.create!(picture_comment: "Warm sombre by Lauren", photo_url: "http://s3-media2.fl.yelpcdn.com/bphoto/cclZJU6rr3bDIoO_wy0dwg/o.jpg")
#
# barber_3.pictures.create!(photo_url: "http://s3-media1.fl.yelpcdn.com/bphoto/UoY1ZzfSqk18JCmrwtzzYA/o.jpg")
# barber_3.pictures.create!(photo_url: "http://s3-media4.fl.yelpcdn.com/bphoto/wFJAKqVmOUrAa1MrfdPbFw/o.jpg")
# barber_3.pictures.create!(photo_url: "http://s3-media3.fl.yelpcdn.com/bphoto/x9Hhk9zcKnUHVo59yCoFrA/o.jpg")
# barber_3.pictures.create!(photo_url: "http://s3-media2.fl.yelpcdn.com/bphoto/osobIvmVOp4aHpS4dHPBEg/o.jpg")
# barber_2.pictures.create!(photo_url: "http://s3-media1.fl.yelpcdn.com/bphoto/RKb1-j9oQ6jZL7XeRXJ-iA/o.jpg")
# barber_2.pictures.create!(photo_url: "http://s3-media1.fl.yelpcdn.com/bphoto/UwUS_kjqIkLgl9ejB8-KRQ/o.jpg")
# barber_2.pictures.create!(photo_url: "http://s3-media1.fl.yelpcdn.com/bphoto/YC37DZvOJPDVF3hUDTXRGQ/o.jpg")
# barber_2.pictures.create!(photo_url: "http://s3-media3.fl.yelpcdn.com/bphoto/KrL-94pJJUm4xgsGeUTcqg/o.jpg")


######################################## Shop 2


shop2 = Shop.create!(moderator_id: 1,
             name: "Black & Gold Barber Lounge",
             address: "6755 Mission St",
             city: "Daly City",
             state: "CA",
             zip: "94014",
             phone: 6505504180,
             rating: 0.0,
             tag_list: ,
             location_list: ,
             photo_url: "http://s3-media3.fl.yelpcdn.com/bphoto/2vYcw6f5426vZAIqINaekg/o.jpg")

 barber_4 = Barber.create!(name: "Derrick", shop_id: ,skill_list: [], photo_url: )
 barber_5 = Barber.create!(name: "Mark", shop_id: , skill_list: [], photo_url:)

 barber_4.pictures.create!(photo_url: )
 barber_4.pictures.create!(photo_url: )
 barber_4.pictures.create!(photo_url: )
 barber_4.pictures.create!(photo_url: )
 barber_5.pictures.create!(photo_url: )
 barber_5.pictures.create!(photo_url: )
 barber_5.pictures.create!(photo_url: )
 barber_5.pictures.create!(photo_url: )


 shop_2_review_1 = shop2.reviews.create!(body: , author_id: 1, shop_id: shop2.id , barber_id: barber_4.id, rating: )
 shop_2_review_2 = shop2.reviews.create!(body: , author_id: 2, shop_id: shop2.id, barber_id: barber_4.id, rating: )
 shop_2_review_3 = shop2.reviews.create!(body: , author_id: 3, shop_id: shop2.id, barber_id: barber_5.id, rating: )
 shop_2_review_4 = shop2.reviews.create!(body: , author_id: 4, shop_id: shop2.id, barber_id: barber_5.id, rating: )

shop_2_review_2.pictures.create!(photo_url:)
shop_2_review_4.picture.create!(photo_url: )



 ######################################## Shop 3



 shop3 = Shop.create!(moderator_id: 1,
             name: "JosephAlex Salon",
             address: "660 Market St 2nd Fl",
             city: "San Francisco",
             state: "CA",
             zip: "94104",
             phone: 5107179886,
             rating: 0.0,
             tag_list: ["stylist, extensions, coloring, hair cutting, african-american, ethnic, ethnic hair, color, womens, womens haircut, women haircut"],
             location_list: ["san francisco, union square"],
             photo_url: "http://s3-media3.fl.yelpcdn.com/bphoto/UBZiXML8Kkv3gkeVxhppxg/o.jpg")
barber_6 = shop3.barbers.create!(name: "JosephAlex", shop_id: , skill_list: [], photo_url: )

barber_6.pictures.create!(photo_url: )
barber_6.pictures.create!(photo_url: )
barber_6.pictures.create!(photo_url: )
barber_6.pictures.create!(photo_url: )
barber_6.pictures.create!(photo_url: )
barber_6.pictures.create!(photo_url: )


shop_3_review_1 = shop3.reviews.create!(body: , author_id: 1, shop_id: shop_3.id, barber_id: barber_6.id, rating: 5)
shop_3_review_2 = shop3.reviews.create!(body: , author_id: 2, shop_id: shop_3.id, barber_id: barber_6.id, rating: 5)
shop_3_review_3 = shop3.reviews.create!(body: , author_id: 3, shop_id: shop_3.id, barber_id: barber_6.id, rating: 4)
shop_3_review_4 = shop3.reviews.create!(body: , author_id: 4, shop_id: shop_3.id, barber_id: barber_6.id, rating: 5)


######################################## Shop 4


shop4 = Shop.create!(moderator_id: 1,
            name: "J.P. Kempt Barber",
            address: "351 Divisadero St",
            city: "San Francisco",
            state: "CA",
            zip: "94117",
            phone: 4154371300,
            rating: 0.0,
            tag_list: ["barber, barbershop, haircuts, hot lather shaves, beard trim, barber facials, beard, shave"],
            location_list: ["san francisco, lower haight"],
            photo_url: "http://s3-media3.fl.yelpcdn.com/bphoto/jo1oMvtqEYOfhsbXCS-Kpw/o.jpg")

barber_7 = shop4.barbers.create!(name: "Jourdan", skill_list: [], shop_id: , photo_url:)

barber_7.pictures.create!(photo_url:)
barber_7.pictures.create!(photo_url:)
barber_7.pictures.create!(photo_url:)
barber_7.pictures.create!(photo_url:)

shop_4_review_1 = shop4.reviews.create!(body: , author_id: 4, shop_id: shop4.id, barber_id: barber_7.id, rating: )
shop_4_review_2 = shop4.reviews.create!(body: , author_id: 3, shop_id: shop4.id, barber_id: barber_7.id, rating: )



######################################## Shop 5


shop5 = Shop.create!(moderator_id: 1,
            name: "Follicle Hair Salon",
            address: "540 Sutter St",
            city: "San Francisco",
            state: "CA",
            zip: "94102",
            phone: 4154025277,
            rating: 0.0,
            tag_list: ["bang trim, highlights, color, tone, ombre, keratin treatment, bayalage"],
            location_list: ["san francisco, union square"],
            photo_url: "http://s3-media1.fl.yelpcdn.com/bphoto/wFJAKqVmOUrAa1MrfdPbFw/.jpg")

barber_8 = Barber.create!(name: "Kim Carmichael", shop_id: shop5.id, skill_list: ["highlights", "brazilian blowout", "ombre"], photo_url:)
barber_9 = Barber.create!(name: "Chanin", skill_list: [] , shop_id: shop5.id, photo_url:)

barber_8.pictures.create!(photo_url:)
barber_8.pictures.create!(photo_url:)
barber_8.pictures.create!(photo_url:)
barber_8.pictures.create!(photo_url:)

barber_9.pictures.create!(photo_url:)
barber_9.pictures.create!(photo_url:)

shop_5_review_1 = shop5.reviews.create!(body: , author_id: 2, shop_id: , barber_id: , rating: )
shop_5_review_2 = shop5.reviews.create!(body: , author_id: 3, shop_id: , barber_id: , rating: )
shop_5_review_3 = shop5.reviews.create!(body: , author_id: 1, shop_id: , barber_id: , rating: )
shop_5_review_4 = shop5.reviews.create!(body: , author_id: 4, shop_id: , barber_id: , rating: )

barber_7.pictures.create!(picture_comment: "Amazing Ombre and layered haircut by Kim Carmichael!", photo_url: "http://s3-media4.fl.yelpcdn.com/bphoto/wFJAKqVmOUrAa1MrfdPbFw/o.jpg")


######################################## Shop 6



shop6 = Shop.create!(moderator_id: 1,
            name: "Emilio's Barbershop",
            address: "5734 Mission St",
            city: "San Francisco",
            state: "CA",
            zip: "94112",
            phone: 4157158227,
            rating: 0.0,
            tag_list: ["pompadour, barber, fade, barbers, mens haircut, womens, womens haircut, shaves, flat tops, buzz cut, shadow fade, skin fade, bald fade, tapers, line ups, razor line"],
            location_list: ["san francisco, outer mission"],
            photo_url: "http://s3-media3.fl.yelpcdn.com/bphoto/E1Z8K2ve064hp1cGXHpdHA/o.jpg")

barber_10 = Barber.create!(name: "Savy", skill_list: [], shop_id: shop6.id, photo_url:)
barber_11 = Barber.create!(name: "Emilio", skill_list: [])

barber_10.pictures.create!(photo_url:)
barber_10.pictures.create!(photo_url:)
barber_10.pictures.create!(photo_url:)

barber_11.pictures.create!(photo_url:)
barber_11.pictures.create!(photo_url:)

shop_6_review_1 = shop6.reviews.create!(body: , author_id: 4, shop_id: shop6.id, barber_id: barber_10.id, rating: )
shop_6_review_2 = shop6.reviews.create!(body: , author_id: 2, shop_id: shop6.id, barber_id: barber_10.id, rating: )
shop_6_review_3 = shop6.reviews.create!(body: , author_id: 3, shop_id: shop6.id, barber_id: barber_11.id, rating: )
shop_6_review_4 = shop6.reviews.create!(body: , author_id: 1, shop_id: shop6.id, barber_id: barber_11.id, rating: )




#
# # Follicle
#
# kim.pictures.create!(picture_comment: "Amazing Ombre and layered haircut by Kim Carmichael!", photo_url: "http://s3-media4.fl.yelpcdn.com/bphoto/wFJAKqVmOUrAa1MrfdPbFw/o.jpg")
# "barbers": [
#   "Kim", "Chanin"

#
# # JosephAlex
# "barbers": ["JosephAlex"],
# "tag_list": ["extensions", "coloring", "hair cutting", "african-american", "ethnic", "ethnic hair", "color", "womens", "womens haircut", "women haircut"],
# "location_list": ["Financial District"],
# # Review.create!(author_id: 2, body: "Butters was great. Would get another cut by him", shop_id: 1, barber_id: 1, rating: 5)
# # Review.create!(author_id: 3, body: "Harry was aiite.", shop_id: 1, barber_id: 1, rating: 4)
# # Review.create!(author_id: 2, body: "Stella +1", shop_id: 1, barber_id: 1, rating: 5)
# # Review.create!(author_id: 1, body: "Hoppy poppy was fire.", shop_id: 1, barber_id: 1, rating: 4)
