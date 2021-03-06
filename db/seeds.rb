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
Picture.destroy_all

user1 = User.create!(username: "guest", email: 'guest@gmail.com' , password: 'admin525', photo_url: "https://dl.dropboxusercontent.com/s/zp27re1j4301pii/user_5.jpg", thumb_url: "https://dl.dropboxusercontent.com/s/zp27re1j4301pii/user_5.jpg")
user2 = User.create!(username: "kevin", admin: true, email: 'kevin@gmail.com' , password: 'wildfire', photo_url: "https://dl.dropboxusercontent.com/s/5i52djfnyj5ud5r/me.jpeg", thumb_url: "https://dl.dropboxusercontent.com/s/5i52djfnyj5ud5r/me.jpeg")
user3 = User.create!(username: "lana", email: 'lana@gmail.com', password: 'passw0rd26', photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435588738/avatars/1782139_813044228731992_5708476506467472977_n.jpg")
user4 = User.create!(username: "danny", email: 'danny@gmail.com', password: 'dinkleberg', photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435588686/avatars/10689479_867846916008_7107299238096929499_n.jpg")
user5 = User.create!(username: "vicky", email: 'vicky@gmail.com', password: 'passw0rd26', photo_url: "https://dl.dropboxusercontent.com/s/83d8r8vtw28mb3v/user_1.jpg", thumb_url: "https://dl.dropboxusercontent.com/s/83d8r8vtw28mb3v/user_1.jpg")
user6 = User.create!(username: "suavecito", email: 'suavecity@pomade.com', password: 'genakn', photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435587601/avatars/images.jpg")
user7 = User.create!(username: "bonnie", email: 'adagioolo@escargo.com', password: 'gmleamgl', photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435357426/avatars/qsfxi67w0hsfb2988y6k.jpg")
user7 = User.create!(username: "adagio", email: 'adagio@escargo.com', password: 'passw0rd26', photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435357426/avatars/qsfxi67w0hsfb2988y6k.jpg")


######################################### Shop 1

shop1 = Shop.create!(moderator_id: 1,
             name: "PATRICK EVAN Hair Salon",
             address: "55 Grant Avenue 4th Fl",
             city: "San Francisco",
             state: "CA",
             zip: "94108",
             phone: 4154211111,
             rating: 0.0,
             latitude: 37.7909427,
             longitude: -122.4084994,
             tag_list: ["women, womens, keratin, keratin treatment, japanese hair straightening, curly hair, extensions, straight perms, coloring, thermal reconditioning, womens haircut, women haircut"],
             location_list: ["san francisco, union square, financial district"],
             photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/rq3KWK5doz7Yltts1O2RnQ/o.jpg")
barber_2 = Barber.create!(name: "Trevor", shop_id: shop1.id,  skill_list: ["coloring, keratin treatments"], photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/EGWxZatDc11tZosACS4qvA/o.jpg")
barber_3 = Barber.create!(name: "Lauren", shop_id: shop1.id, skill_list: ["thermal reconditioning, coloring"], photo_url: "https://res.cloudinary.com/mycut/image/upload/c_fill,g_faces,h_300,w_200/v1435005797/barbers/lauren.jpg")
shop1_review_1 = shop1.reviews.create!(body: "This is the best salon experience I've ever had! From the start, Mary Ann (the receptionist, I believe) was super sweet and helpful. When I got there, I was warmly greeted by nearly everyone there. There was a bit of a miscommunication (I scheduled for a balayage but they had only listed me for a haircut). But my hair stylist, Britney, was accommodating and did the balayage anyway. The color turned out even better than I could've imagined. She was knowledgeable and really cool. The only negative thing was at the end when I was paying, another receptionist was helping me with my payment. I stood there for a while after I got my receipt, thinking there was a next step because she didn't say a word after. So after a few minutes of waiting at the desk, I asked, 'Am I all set?' and she just replied with yeah"  , author_id: 1, barber_id: barber_3.id, rating: 5)
shop1_review_2 = shop1.reviews.create!(body: "I absolutely LOVE this salon! I have followed two of their greatest stylists (Olive and Kat) from a previous salon and their work continues to shine over anything else I've ever seen. The way both of these girls work their color magic keeps me coming back time and time again and I'm so happy that this place exists so that they can continue their awesome work. Both ladies are extremely warm and talented and ask if you'd like coffee or tea upon arrival and WILL NOT let you leave unless you're 100% satisfied with what they've done. As a woman, its hard to trust people with something as precious as your hair color, and I'm telling you - if you want the job done not just right and professionally - but with warmth and character - ask for them! Seriously cannot go wrong with what they do!

Trevor works amazingly as well! All three people I would recommend over and over again!", author_id: 2, barber_id: barber_2.id, rating: 5 )
shop1_review_3 = shop1.reviews.create!(body: "Lauren (and her assistant Haili) did an AMAZING job!! They darkened my hair near the roots, but just enough so that it still looked like a nutty brown overall. The ends are a perfect sombre and it is a BEAUTIFUL ashy brown (no brassiness, yay!)" , author_id: 3, barber_id: barber_3.id, rating: 5)

shop1_review_1.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/bgOJhsbWVty9GDOx4j7gbw/o.jpg")
shop1_review_2.pictures.create!(picture_comment: "loving my hair!", photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/osobIvmVOp4aHpS4dHPBEg/o.jpg")
shop1_review_3.pictures.create!(picture_comment: "Warm sombre by Lauren", photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/cclZJU6rr3bDIoO_wy0dwg/o.jpg")

barber_3.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/UoY1ZzfSqk18JCmrwtzzYA/o.jpg")
barber_3.pictures.create!(photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/wFJAKqVmOUrAa1MrfdPbFw/o.jpg")
barber_3.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/x9Hhk9zcKnUHVo59yCoFrA/o.jpg")
barber_3.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/osobIvmVOp4aHpS4dHPBEg/o.jpg")
barber_2.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/UwUS_kjqIkLgl9ejB8-KRQ/o.jpg")
barber_2.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/YC37DZvOJPDVF3hUDTXRGQ/o.jpg")
barber_2.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/KrL-94pJJUm4xgsGeUTcqg/o.jpg")


######################################## Shop 2


shop2 = Shop.create!(moderator_id: 1,
             name: "Black & Gold Barber Lounge",
             address: "6755 Mission St",
             city: "Daly City",
             state: "CA",
             zip: "94014",
             phone: 6505504180,
             rating: 0.0,
             latitude: 37.700396,
             longitude: -122.463259,
             tag_list: ["bald fade, taper, fade, lineup, lineups, razor fade, freestyle"],
             photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/2vYcw6f5426vZAIqINaekg/o.jpg")

 barber_4 = Barber.create!(name: "Derrick", shop_id: shop2.id, skill_list: ["bald fade, fade, taper, lineup, skin fade"], photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/_bmVfuNQybHT1k3DHzCdKA/o.jpg")
 barber_5 = Barber.create!(name: "Mark", shop_id: shop2.id, skill_list: ["taper, fade, bald fade, skin fade, lineup"], photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/WB02AHh7TbT0IY9KspN0zQ/o.jpg")

 barber_4.pictures.create!(photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/w70Qeh-UxNHj15abX1GKwg/o.jpg")
 barber_4.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/g6q4wM2pNNaqVpEjZmb6Mg/o.jpg")
 barber_4.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/ITlGLqLsAPWKVr6rAplFsQ/o.jpg")
 barber_4.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/bjPcldVWzpCt-Ntnp_nt-g/o.jpg")
 barber_5.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/BdoP3nE-U_8M3U4r7fY4AA/o.jpg")
 barber_5.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/3QQHKT5qCKvY-2QZCVy7tg/o.jpg")
 barber_5.pictures.create!(photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/3VSZBATXy8bhzEHLtrAHcw/o.jpg")
 barber_5.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/9us0ShBXh9YM6z5Rj3e7rw/o.jpg")
 barber_5.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/CKwthbNkoYHAwh2z4qEgSQ/o.jpg")


 shop_2_review_1 = shop2.reviews.create!(body: "I've been a customer of Derrick's for about 5-6 years now and can't imagine being cut by anyone else.  If I could give it 6 stars, I would.  Derrick makes sure that you're happy with the results and will remember exactly how to cut you the next time you go back.  I'm a bit OCD with my haircuts, so it says a lot that I've been 100% happy with my cut every time.  And I go every week.", author_id: 1, shop_id: shop2.id , barber_id: barber_4.id, rating: 5)
 shop_2_review_2 = shop2.reviews.create!(body: "There is so much i can say about this place so i might as well do so. I came into this place because my friend's had a little pop up Vape shop inside. After visiting a few times i finally decided to get a nice haircut there. After setting up an appt. with Derrick I realized this is going to be good. \nAfter sitting in the chair and trusting in my barber I realized man this guy knows exactly what he is doing. He took the time to get the perfect blend and was very precise on the clean up. I walked out with a huge smile on my face and a awesome haircut. Ever since that day I have gone to this shop for a clean cut. \nBlack & Gold literally makes me feel at home and I seriously trust anyone in the shop with my hair. Please book an appt. with them because their books fill up quick! \nThanks for always taking care of me guys!", author_id: 2, shop_id: shop2.id, barber_id: barber_4.id, rating: 5)
 shop_2_review_3 = shop2.reviews.create!(body: "I highly recommend Mark! I moved to the bay area two months ago and have been searching for a skilled, reliable and personable barber. Mark is the best I've found, again, I highly recommend him!", author_id: 3, shop_id: shop2.id, barber_id: barber_5.id, rating: 5)
 shop_2_review_4 = shop2.reviews.create!(body: "My first legit barber experience today with Mark and I was super happy with it! Since I got my side shave I've been wanting to go get something designed but all the nearby shops had sketch reviews. This spot is the perfect balance of chill, hipster, homeboys, and Jagged Edge. Also appreciated that Mark took his time (I didn't know what was possible so he freestyled), you can tell he cares about his art and knows what he's doing. He also was way more gentle then even some salon stylists I been too. \nSo you're welcome ladies (and gents), I just found you your new man!" , author_id: 4, shop_id: shop2.id, barber_id: barber_5.id, rating: 5)

shop_2_review_3.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/rwod7HmKrq9Wkq_57mFkhw/o.jpg")
shop_2_review_4.pictures.create!(photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/3VSZBATXy8bhzEHLtrAHcw/o.jpg")


#
#  ######################################## Shop 3



shop3 = Shop.create!(moderator_id: 1,
             name: "JosephAlex Salon",
             address: "660 Market St 2nd Fl",
             city: "San Francisco",
             state: "CA",
             zip: "94104",
             phone: 5107179886,
             rating: 0.0,
             latitude: 37.7911148,
             longitude: -122.4021273,
             tag_list: ["stylist, extensions, coloring, hair cutting, african-american, ethnic, ethnic hair, color, womens, womens haircut, women haircut"],
             location_list: ["san francisco, union square"],
             photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/UBZiXML8Kkv3gkeVxhppxg/o.jpg")
barber_6 = shop3.barbers.create!(name: "JosephAlex", shop_id: shop3.id, skill_list: ["Anything you need"], photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/UBZiXML8Kkv3gkeVxhppxg/o.jpg")

barber_6.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/JDsGuYeUG-PAJyXXkLnFmQ/o.jpg")
barber_6.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/vg9aWJOXppkrw_Uj-Wh7ZQ/o.jpg")
barber_6.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/f4yDrUsatTqAW9uHsI0pNg/o.jpg")
barber_6.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/96rVUcZGMsG3NCM3fj-CyA/o.jpg")
barber_6.pictures.create!(photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/Wd0kggJFJ9H2kXfrZYJDCA/o.jpg")


shop_3_review_1 = shop3.reviews.create!(body: "I've been going to Joseph for just over 2 years now. I found him by yelp accident and now I will not leave him! Joseph has done amazing things with my hair! His highlights and color are always on point!

 He takes the time to curl my stubborn non-curlable hair.  He even took the time to explain what products would benefit my hair and make it healthier.", author_id: 1, shop_id: shop3.id, barber_id: barber_6.id, rating: 5)
shop_3_review_2 = shop3.reviews.create!(body: "I love getting my hair done by Joseph.  He is truly talented and knows what the client wants and what would work for them. I have been getting a hair cut and color from him for over a year now and have followed him everywhere he goes.

He knows what works best for my wavy hair and always gives me a cut that works with my natural curl. Whether you want a radical change in hair color or just subtle sun kissed high lights he's the best! I love how he treats you and you feel so pampered after you go see him. I highly recommend him.

 If you are looking for a talented stylist with reasonable prices and great results Joseph's your guy.", author_id: 2, shop_id: shop3.id, barber_id: barber_6.id, rating: 5)
shop_3_review_3 = shop3.reviews.create!(body: "He takes time, makes suggestions, and just really has a good eye. Its lots of fun to go see him. Like someone else on here said 'I always walk away feeling like a gazillion bucks'! Oh, and he never tries to sell you product--just makes your hair look fantastic. :)", author_id: 3, shop_id: shop3.id, barber_id: barber_6.id, rating: 4)
shop_3_review_4 = shop3.reviews.create!(body: "This man is amazing. I've been going to him for years. He is an utmost professional and always treats me like family when he is dressing my hair. This man takes his work seriously and is fantastic. Every treatment I've gotten from him is worth noting. I have put him through a lot of ringers these past years; cuts, colors (not always natural colors), washes, cornrows, curls, product advise. Almost anything you could do to ones head, and still more to come.

He is truly a renaissance man when it comes to hair fashion. You will not have a better experience than with him. He is the only stylist that I wholeheartedly recommend to anyone when they ask if I know anyone who'd meet their hair dressing needs. ", author_id: 4, shop_id: shop3.id, barber_id: barber_6.id, rating: 5)

shop_3_review_3.pictures.create!(photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/NL_daC6loTHosvuk0np8Aw/o.jpg")
#
# ######################################## Shop 4


shop4 = Shop.create!(moderator_id: 1,
            name: "J.P. Kempt Barber",
            address: "351 Divisadero St",
            city: "San Francisco",
            state: "CA",
            zip: "94117",
            phone: 4154371300,
            rating: 0.0,
            latitude: 37.7729453,
            longitude: -122.4374211,
            tag_list: ["barber, barbershop, haircuts, hot lather shaves, beard trim, barber facials, beard, shave"],
            location_list: ["san francisco, lower haight"],
            photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/jo1oMvtqEYOfhsbXCS-Kpw/o.jpg")

barber_7 = shop4.barbers.create!(name: "Jourdan", skill_list: ["shaves, haircuts, beard trim"], shop_id: shop4.id, photo_url:"https://s3-media2.fl.yelpcdn.com/bphoto/h_1osWGSbYnESP6u_Lfx-Q/o.jpg")

barber_7.pictures.create!(photo_url:"https://s3-media3.fl.yelpcdn.com/bphoto/eG9CY4R3tSmYTuKWCbcb2Q/o.jpg")

shop_4_review_1 = shop4.reviews.create!(body: "Like some of the other reviews, I was once a Public regular in North Beach until I moved to NOPA and discovered this special shop. At that time, I had developed a regular routine of blowdrying my hair for 15 minutes each morning and buying a handful of expensive 'must-have' products per the advice of my 'barber' at Public. Since seeing Jourdan at JP Kempt, I've shed the blowdryer, resigned myself to one affordable product that gets the job done... and regained my mornings and swagger in the process. I can't say enough about the quality of work they do at JP Kempt.", author_id: 4, shop_id: shop4.id, barber_id: barber_7.id, rating: 5)
shop_4_review_2 = shop4.reviews.create!(body: "Jourdan was my Barber and what a mighty fine job she did. I could barely leave the chair I was so relaxed, and my face just feels magnificent.", author_id: 3, shop_id: shop4.id, barber_id: barber_7.id, rating: 4.5)


#
# ######################################## Shop 5


shop5 = Shop.create!(moderator_id: 1,
            name: "Follicle Hair Salon",
            address: "540 Sutter St",
            city: "San Francisco",
            state: "CA",
            zip: "94102",
            phone: 4154025277,
            latitude: 37.7892953,
            longitude: -122.4094122,
            rating: 0.0,
            tag_list: ["bang trim, highlights, color, tone, ombre, keratin, keratin treatment, bayalage"],
            location_list: ["san francisco, union square"],
            photo_url: "https://s3-media1.fl.yelpcdn.com/bphoto/wFJAKqVmOUrAa1MrfdPbFw/o.jpg")

barber_8 = Barber.create!(name: "Kim Carmichael", shop_id: shop5.id, skill_list: ["highlights", "brazilian blowout", "ombre"], photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/vA-H5nLm6cowSjX6MnRqFQ/o.jpg")
barber_9 = Barber.create!(name: "Chanin", skill_list: [] , shop_id: shop5.id, photo_url:"https://s3-media2.fl.yelpcdn.com/bphoto/F40U2oYIhscGrVL-lM1erA/o.jpg")

barber_8.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/vA-H5nLm6cowSjX6MnRqFQ/o.jpg")
barber_8.pictures.create!(photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/wFJAKqVmOUrAa1MrfdPbFw/o.jpg")

barber_9.pictures.create!(photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/O2MxT-3WbsNzDs8dAaEE0g/o.jpg")
barber_9.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/9_zidRRD593kCWRToRLmjg/o.jpg")

shop_5_review_1 = shop5.reviews.create!(body: "I was referred to Chanin over a year ago to have some highlights, tint and a cut done. I cannot tell you how happy I am with her work. Chanin listens to your needs and also makes recommendations that in the end turn out beautiful.

 Many people have cut my hair and done a good job. Chanin is one of the first hairdressers I can say I Love my haircut! She nailed it and I am one picky broad! Chanin does fantastic color and knows how to cut! Highly recommend!", author_id: 2, shop_id: shop5.id, barber_id: barber_9.id, rating: 5)
shop_5_review_2 = shop5.reviews.create!(body: "My stylist KIM CARMICHAEL. Half way through my session I looked like a different person and my hair was doing stuff I've never seen before. I asked for just a little trim, but instead I got a super buzzed hipster haircut, you know the side sweep to one side look.

Although that is a popular style, it just doesn't look good on me. After my haircut, I couldn't look at people because I was so ashamed of what I looked like. I will never go back and I wouldn't book KIM CARMICHAEL if you are a guy.", author_id: 3, shop_id: shop5.id, barber_id: barber_8.id, rating: 1)
shop_5_review_3 = shop5.reviews.create!(body: "I have high maintenance, thick, curly hair, sometimes I feel bad for stylists that have to tame my mane. Kim did a great job and was extremely patient. Had to get a haircut after the blow out and I must say I was impressed.

I hate getting my haircut- I would rather go to the dentist, but Kim cut off just the right amount to where my hair looks healthy and is still long.", author_id: 1, shop_id: shop5.id, barber_id: barber_8.id, rating: 4)
shop_5_review_4 = shop5.reviews.create!(body: "I can only thank fate for setting me up with Kim. When I attempted to explain what I wanted to do (while averting my eyes from the unforgiving salon mirror), Kim was completely candid with me - saying she didn't like the current color and that the length wasn't doing anything for me - and it left me trusting her immediately", author_id: 4, shop_id: shop5.id, barber_id: barber_8.id, rating: 5)


# ######################################## Shop 6
#


shop6 = Shop.create!(moderator_id: 1,
            name: "Emilio's Barbershop",
            address: "5734 Mission St",
            city: "San Francisco",
            state: "CA",
            zip: "94112",
            phone: 4157158227,
            rating: 0.0,
            latitude: 37.7099397,
            longitude: -122.4500877,
            tag_list: ["pompadour, barber, fades, fade, barbers, mens haircut, womens, womens haircut, shaves, flat tops, buzz cut, shadow fade, skin fade, bald fade, tapers, line ups, razor line"],
            location_list: ["san francisco, outer mission"],
            photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/E1Z8K2ve064hp1cGXHpdHA/o.jpg")

barber_10 = Barber.create!(name: "Savy", skill_list: ["designs"], shop_id: shop6.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
barber_11 = Barber.create!(name: "Emilio", skill_list: ["fades, tapers, bald taper, bald fade, lineup"], shop_id: shop6.id, photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/s-piSUo22qKjS-B9-9iGBw/o.jpg")

barber_10.pictures.create!(photo_url:"https://s3-media4.fl.yelpcdn.com/bphoto/yXBFoP1XyclAaYTS912qmg/o.jpg")
barber_10.pictures.create!(photo_url:"https://s3-media3.fl.yelpcdn.com/bphoto/7E_3Nz5TCMDIY4Bl2T8Dow/o.jpg")
barber_10.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/865PsGpNaSu4jbMiEcYTSQ/o.jpg")

barber_11.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/YsZlJCqcYl9lbJkFBqalEg/o.jpg")
barber_11.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/z9GpvE4d5-t7ve93dE0bkw/o.jpg")
barber_11.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/3Ett_OAQ6ycTaUfBuv7-9g/o.jpg")
barber_11.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/_NR9UWHsTo1p4B_RVn6c-g/o.jpg")
barber_11.pictures.create!(photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/9WHL0OVIs_RWi89Nk_M1mA/o.jpg")
barber_11.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/loXVqDul7vylMcQB4NNZIg/o.jpg")

shop_6_review_1 = shop6.reviews.create!(body: "Go see Savy and avoid all 3! Shes got mad skills and a chill sense of humor.", author_id: 4, shop_id: shop6.id, barber_id: barber_10.id, rating: 5)
shop_6_review_2 = shop6.reviews.create!(body: "One hour later, I was seated. I ended up getting cut by Saavy. She's nice, gave me the cut and hard part I wanted, and seemed detail-oriented.

 Only issue was that I was knicked and cut on both sides of my head and in the back of my neck during the line-up. 9 hours later, it still burns when I showered and it's still bleeding. $25 for the haircut, and even though I was bleeding, I still gave tip 'cause I'm a nice guy.", author_id: 2, shop_id: shop6.id, barber_id: barber_10.id, rating: 1)
shop_6_review_3 = shop6.reviews.create!(body: "First time at this place and it was great! Needed a fresh cut before prom and Emilio didn't dissapoint. Possibly one of the cleanest cut I've ever gotten and I will definately be coming back. The price is also great", author_id: 3, shop_id: shop6.id, barber_id: barber_11.id, rating: 5)
shop_6_review_4 = shop6.reviews.create!(body: "I've been going to Emilio's for the past 3 years. Despite no longer living in the area, I still go out of my way and make the drive out to his barbershop because I know I'll get a great haircut every time.

It's a great, old school shop with new school barbers.  They've done everything from fauxhawks, fades, and tapers for me. Savy and Emilio are A+ in my opinion.", author_id: 1, shop_id: shop6.id, barber_id: barber_11.id, rating: 5)


shop_6_review_3.pictures.create!(photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/YA0EZVwvjkgBJRdSdJyrgQ/o.jpg")
shop_6_review_2.pictures.create!(photo_url:"https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
#
#
# # ######################################## Shop 7
# shop7 = Shop.create!(moderator_id: 2,
#             name: "Slick and Dapper Barber Shop",
#             address: "3619 Grand Ave",
#             city: "Oakland",
#             state: "CA",
#             zip: "94610",
#             phone: 5102510796,
#             rating: 0.0,
#             latitude: 37.8154102,
#             longitude: -122.2460818,
#             tag_list: ["haircuts, straight razor shaves, razor shaves, beard trim, seniors, first responders, responders, children, traditional, hipster"],
#             location_list: ["lower hills, grand lake"],
#             photo_url: "http://s3-media4.fl.yelpcdn.com/bphoto/az76ciYPK229M4TJXvccKQ/o.jpg")
#
# barber_12 = Barber.create!(name: "Manny", skill_list: ["designs"], shop_id: shop6.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
# barber_13 = Barber.create!(name: "Nick", skill_list: ["fades, tapers, bald taper, bald fade, lineup"], shop_id: shop6.id, photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/s-piSUo22qKjS-B9-9iGBw/o.jpg")
#
# barber_12.pictures.create!(photo_url:"")
# barber_12.pictures.create!(photo_url:"")
# barber_12.pictures.create!(photo_url: "")
#
# barber_13.pictures.create!(photo_url: "")
# barber_13.pictures.create!(photo_url: "")
# barber_13.pictures.create!(photo_url: "")
# barber_13.pictures.create!(photo_url: "")
# barber_13.pictures.create!(photo_url: "")
# barber_13.pictures.create!(photo_url: "")
#
# shop_6_review_1 = shop6.reviews.create!(body: "", author_id: 4, shop_id: shop6.id, barber_id: barber_10.id, rating: 5)
# shop_6_review_2 = shop6.reviews.create!(body: "", author_id: 2, shop_id: shop6.id, barber_id: barber_10.id, rating: 1)
# shop_6_review_3 = shop6.reviews.create!(body: "", author_id: 3, shop_id: shop6.id, barber_id: barber_11.id, rating: 5)
# shop_6_review_4 = shop6.reviews.create!(body: "", author_id: 1, shop_id: shop6.id, barber_id: barber_11.id, rating: 5)
#
#
# shop_6_review_3.pictures.create!(photo_url: "")
# shop_6_review_2.pictures.create!(photo_url: "")
#
# # ######################################## Shop 8
#
# shop_8 = Shop.create!(moderator_id: 1,
#             name: "Temescal Alley Barber Shop",
#             address: "470-B 49th St",
#             city: "Oakland",
#             state: "CA",
#             zip: "94609",
#             phone: 5107615074,
#             rating: 0.0,
#             latitude: 37.8361206,
#             longitude: -122.2618713,
#             tag_list: ["", ""],
#             location_list: ["", ""],
#             photo_url: "")
# barber14 = Barber.create!(name: "Savy", skill_list: ["designs"], shop_id: shop_8.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
# barber_15 = Barber.create!(name: "Emilio", skill_list: ["fades, tapers, bald taper, bald fade, lineup"], shop_id: shop_8.id, photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/s-piSUo22qKjS-B9-9iGBw/o.jpg")
#
# barber14.pictures.create!(photo_url:"")
# barber14.pictures.create!(photo_url:"")
# barber14.pictures.create!(photo_url: "")
#
# barber_15.pictures.create!(photo_url: "")
# barber_15.pictures.create!(photo_url: "")
# barber_15.pictures.create!(photo_url: "")
# barber_15.pictures.create!(photo_url: "")
# barber_15.pictures.create!(photo_url: "")
# barber_15.pictures.create!(photo_url: "")
#
# shop_8_review_1 = shop_8.reviews.create!(body: "My barber did an awesome job cutting my hair at TABS. I had been going to a place in Pleasanton only because it was convenient to my old job, so I went in not really knowing what to expect from TABS. It can be a hit or miss in finding a good barber to give a good cut without you having to explain in detail what you want and what looks for you.  My barber cut my hair how I wanted and suggested a couple changes, which I am glad he did.
#
# It is a great environment and everyone was in a good mood to be working on a Sunday.
#
# Make sure to bring cash (cash only) and expect to wait during the weekend.  I put my name on the board, went over to the farmers market, and got a bite to eat. By the time I got back it was my turn.
#
# ", author_id: 4, shop_id: shop_8.id, barber_id: barber14.id, rating: 5)
# shop_8_review_2 = shop_8.reviews.create!(body: "", author_id: 7, shop_id: shop_8.id, barber_id: barber14.id, rating: 3)
# shop_8_review_3 = shop_8.reviews.create!(body: "", author_id: 1, shop_id: shop_8.id, barber_id: barber_15.id, rating: 2)
# shop_8_review_4 = shop_8.reviews.create!(body: "I'm really disappointed in the haircut that was given to my daughter's fiancee at Temescal Alley Barber Shop. I gave him a gift certificate for his birthday to come here, and I went on and on about how cool this place was.
# We were excited to see what they could do, and I was confident that they would give him a cool hair cut. Sadly though,he ended up leaving with the worst haircut I have seen in a long time. My daughter told the barber to cut it shorter and he didn't listen.
# I should say that my daughter's fiancee has curly hair. Hair cutters almost always tend to freak out a little bit with curly hair, and this guy was no different. But if you look at my photos, this was just a horrible job. From the sideburns, to the round lolly pop effect he gave him.
# To top it off, my daughter had to re- cut it when they got home, because they were going to have their engagement pictures in a couple of days after this tragic hair cut!  I'm warning all those guys who have curly hair to not go here. I think all they know how to work with is straight hair.
# The service was not good from start to finish. When they walked in they were asked what could they do today, and they said a hair cut. The guy by the door promptly tells them 'Just so you know, this isn't a salon.' No kidding, that is why they were there.", author_id: 5, shop_id: shop_8.id, barber_id: barber_15.id, rating: 1)
#
#
# shop_8_review_3.pictures.create!(photo_url: "")
# shop_8_review_2.pictures.create!(photo_url: "")
# shop_8_review_4.pictures.create!(photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435591220/review/o.jpg")
#
# # ######################################## Shop 9
# shop_9 = Shop.create!(moderator_id: 3,
#             name: "Slick & Dapper On Broadway",
#             address: "4121 Broadway",
#             city: "Oakland",
#             state: "CA",
#             zip: "94611",
#             phone: 5102509569,
#             rating: 0.0,
#             latitude: 37.8288988,
#             longitude: -122.2559286,
#             tag_list: ["", ""],
#             location_list: ["", ""],
#             photo_url: "")
#
# barber_16 = Barber.create!(name: "Savy", skill_list: ["designs"], shop_id: shop_9.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
# barber_17 = Barber.create!(name: "Emilio", skill_list: ["fades, tapers, bald taper, bald fade, lineup"], shop_id: shop_9.id, photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/s-piSUo22qKjS-B9-9iGBw/o.jpg")
#
# barber_16.pictures.create!(photo_url:"")
# barber_16.pictures.create!(photo_url:"")
# barber_16.pictures.create!(photo_url: "")
#
# barber_17.pictures.create!(photo_url: "")
# barber_17.pictures.create!(photo_url: "")
# barber_17.pictures.create!(photo_url: "")
# barber_17.pictures.create!(photo_url: "")
# barber_17.pictures.create!(photo_url: "")
# barber_17.pictures.create!(photo_url: "")
#
# shop_9_review_1 = shop_9.reviews.create!(body: "", author_id: 4, shop_id: shop_9.id, barber_id: barber_16.id, rating: 5)
# shop_9_review_2 = shop_9.reviews.create!(body: "", author_id: 2, shop_id: shop_9.id, barber_id: barber_16.id, rating: 1)
# shop_9_review_3 = shop_9.reviews.create!(body: "", author_id: 3, shop_id: shop_9.id, barber_id: barber_17.id, rating: 5)
# shop_9_review_4 = shop_9.reviews.create!(body: "", author_id: 1, shop_id: shop_9.id, barber_id: barber_17.id, rating: 5)
#
#
# shop_9_review_3.pictures.create!(photo_url: "")
# shop_9_review_2.pictures.create!(photo_url: "")
#
# # ######################################## Shop 10
# shop10 = Shop.create!(moderator_id: 4,
#             name: "Maddix Bruyn, Traditional Barber",
#             address: "1195 65th St",
#             city: "Oakland",
#             state: "CA",
#             zip: "94608",
#             phone: 9499339455,
#             rating: 0.0,
#             latitude: 37.847267,
#             longitude: -122.288048,
#             tag_list: ["traditional, hot lather, straight razor, neck shave, shave, bay rum finish, head shaves, razor fade, fade, contour, barbers, men's hair salon"],
#             photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435596759/shops/o.jpg")
#
# barber_17 = Barber.create!(name: "Maddux", skill_list: ["designs"], shop_id: shop10.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
#
# barber_17.pictures.create!(photo_url:"https://res.cloudinary.com/mycut/image/upload/v1435596864/barbers/barber_portoflio/maddux/o.jpg")
# barber_17.pictures.create!(photo_url:"https://res.cloudinary.com/mycut/image/upload/v1435596947/barbers/barber_portoflio/maddux/as.jpg")
# barber_17.pictures.create!(photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435597003/barbers/barber_portoflio/maddux/maddux3.jpg")
# barber_17.pictures.create!(photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435597030/barbers/barber_portoflio/maddux/maddux4.jpg")
# barber_17.pictures.create!(photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435597057/barbers/barber_portoflio/maddux/maddux5.jpg")
# barber_17.pictures.create!(photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435597123/barbers/barber_portoflio/maddux/maddux6.jpg")
#
# shop_10_review_1 = shop10.reviews.create!(body: "I looked on Yelp. And I looked, and looked. And, eventually,  I stumbled onto to Maddix's page, and realized that not only was he well reviewed, but he took appointments and he was 5 blocks from my home. Done deal.
#
# Got my first haircut today, and I was very happy with the experience. Maddix is a cool guy who knows what he is doing. He's definitely a cut above the typical barber experience in the East Bay, and I will be going back for sure...", author_id: 4, shop_id: shop10.id, barber_id: barber_17.id, rating: 5)
# shop_10_review_2 = shop10.reviews.create!(body: "This guy can give a haircut like NO one!!
#
# Before I started going to Maddix, the only person I would let cut my hair was, well, me. I decided I wanted a cleaner look, and gave him a try - and I never looked back. Amazing cut, great price, and he's always right on time. If I had the option for more than 5 stars, I'd give more.", author_id: 2, shop_id: shop10.id, barber_id: barber_17.id, rating: 5)
# shop_10_review_3 = shop10.reviews.create!(body: "Protip: The phone number listed here is Maddix's cell phone. Text him to make an appointment. As he noted, he's usually booked out a week in advance.
#
# I started off by texting Maddix. He was very helpful and courteous. He could not accommodate my very much last minute and certainly unreasonable request to get into a Saturday morning appointment (I was texting him on Friday night). However, he did refer me to Frank and assured me that the cut would be comparable. I texted Frank and setup an appointment for 11am on Saturday.
# ", author_id: 3, shop_id: shop10.id, barber_id: barber_17.id, rating: 5)
#
# shop_10_review_2.pictures.create!(photo_url: "http://res.cloudinary.com/mycut/image/upload/v1435597363/barbers/barber_portoflio/maddux/maddux7.jpg")
#
#
# # ######################################## Shop 12
# shop_12 = Shop.create!(moderator_id: 2,
#             name: "Marquee Salon",
#             address: "420 40th St",
#             city: "Oakland",
#             state: "CA",
#             zip: "94609",
#             phone: 5102856679,
#             rating: 0.0,
#             latitude: 37.8286204708335,
#             longitude: -122.260081772461,
#             tag_list: ["", ""],
#             location_list: ["", ""],
#             photo_url: "")
#
# barber_21 = Barber.create!(name: "Savy", skill_list: ["designs"], shop_id: shop_12.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
# barber_21 = Barber.create!(name: "Emilio", skill_list: ["fades, tapers, bald taper, bald fade, lineup"], shop_id: shop_12.id, photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/s-piSUo22qKjS-B9-9iGBw/o.jpg")
#
# barber_21.pictures.create!(photo_url:"")
# barber_21.pictures.create!(photo_url:"")
# barber_21.pictures.create!(photo_url: "")
#
# barber_21.pictures.create!(photo_url: "")
# barber_21.pictures.create!(photo_url: "")
# barber_21.pictures.create!(photo_url: "")
# barber_21.pictures.create!(photo_url: "")
# barber_21.pictures.create!(photo_url: "")
# barber_21.pictures.create!(photo_url: "")
#
# shop_12_review_1 = shop_12.reviews.create!(body: "", author_id: 4, shop_id: shop_12.id, barber_id: barber_21.id, rating: 5)
# shop_12_review_2 = shop_12.reviews.create!(body: "", author_id: 2, shop_id: shop_12.id, barber_id: barber_21.id, rating: 1)
# shop_12_review_3 = shop_12.reviews.create!(body: "", author_id: 5, shop_id: shop_12.id, barber_id: barber_21.id, rating: 5)
# shop_12_review_4 = shop_12.reviews.create!(body: "", author_id: 7, shop_id: shop_12.id, barber_id: barber_21.id, rating: 5)
#
#
# shop_12_review_3.pictures.create!(photo_url: "")
# shop_12_review_2.pictures.create!(photo_url: "")
#
# # ######################################## Shop 13
# shop_13 = Shop.create!(moderator_id: 3,
#             name: "Jaujou Studio",
#             address: "3351 Grand Ave",
#             city: "Oakland",
#             state: "CA",
#             zip: "94610",
#             phone: 5102083449,
#             rating: 0.0,
#             latitude: 37.813549,
#             longitude: -122.2468262,
#             tag_list: ["", ""],
#             location_list: ["", ""],
#             photo_url: "")
#
# barber_22 = Barber.create!(name: "Savy", skill_list: ["designs"], shop_id: shop_13.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
# barber_23 = Barber.create!(name: "Emilio", skill_list: ["fades, tapers, bald taper, bald fade, lineup"], shop_id: shop_13.id, photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/s-piSUo22qKjS-B9-9iGBw/o.jpg")
#
# barber_22.pictures.create!(photo_url:"")
# barber_22.pictures.create!(photo_url:"")
# barber_22.pictures.create!(photo_url: "")
#
# barber_23.pictures.create!(photo_url: "")
# barber_23.pictures.create!(photo_url: "")
# barber_23.pictures.create!(photo_url: "")
# barber_23.pictures.create!(photo_url: "")
# barber_23.pictures.create!(photo_url: "")
# barber_23.pictures.create!(photo_url: "")
#
# shop_13_review_1 = shop_13.reviews.create!(body: "", author_id: 4, shop_id: shop_13.id, barber_id: barber_22.id, rating: 5)
# shop_13_review_2 = shop_13.reviews.create!(body: "", author_id: 2, shop_id: shop_13.id, barber_id: barber_22.id, rating: 1)
# shop_13_review_3 = shop_13.reviews.create!(body: "", author_id: 3, shop_id: shop_13.id, barber_id: barber_23.id, rating: 5)
# shop_13_review_4 = shop_13.reviews.create!(body: "", author_id: 1, shop_id: shop_13.id, barber_id: barber_23.id, rating: 5)
#
#
# shop_13_review_3.pictures.create!(photo_url: "")
# shop_13_review_2.pictures.create!(photo_url: "")
#
# # ######################################## Shop 14
# shop_14 = Shop.create!(moderator_id: 3,
#             name: "77Salon Inc",
#             address: "5358 College Ave",
#             city: "Oakland",
#             state: "CA",
#             zip: "94618",
#             phone: 5106017776,
#             rating: 0.0,
#             latitude: 37.8395251,
#             longitude: -122.2512358,
#             tag_list: ["", ""],
#             location_list: ["", ""],
#             photo_url: "")
#
# barber_24 = Barber.create!(name: "Savy", skill_list: ["designs"], shop_id: shop_14.id, photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/JQWT7AXW-3CWr16d3IS_Iw/o.jpg")
# barber_25 = Barber.create!(name: "Emilio", skill_list: ["fades, tapers, bald taper, bald fade, lineup"], shop_id: shop_14.id, photo_url: "https://s3-media4.fl.yelpcdn.com/bphoto/s-piSUo22qKjS-B9-9iGBw/o.jpg")
#
# barber_24.pictures.create!(photo_url:"")
# barber_24.pictures.create!(photo_url:"")
# barber_24.pictures.create!(photo_url: "")
#
# barber_25.pictures.create!(photo_url: "")
# barber_25.pictures.create!(photo_url: "")
# barber_25.pictures.create!(photo_url: "")
# barber_25.pictures.create!(photo_url: "")
# barber_25.pictures.create!(photo_url: "")
# barber_25.pictures.create!(photo_url: "")
#
# shop_14_review_1 = shop_14.reviews.create!(body: "", author_id: 4, shop_id: shop_14.id, barber_id: barber_24.id, rating: 5)
# shop_14_review_2 = shop_14.reviews.create!(body: "", author_id: 2, shop_id: shop_14.id, barber_id: barber_24.id, rating: 1)
# shop_14_review_3 = shop_14.reviews.create!(body: "", author_id: 3, shop_id: shop_14.id, barber_id: barber_25.id, rating: 5)
# shop_14_review_4 = shop_14.reviews.create!(body: "", author_id: 1, shop_id: shop_14.id, barber_id: barber_25.id, rating: 5)
#
#
# shop_14_review_3.pictures.create!(photo_url: "")
# shop_14_review_2.pictures.create!(photo_url: "")
