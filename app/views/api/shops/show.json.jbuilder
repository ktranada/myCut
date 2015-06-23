json.extract! @shop, :moderator_id, :id, :name, :address, :city, :state, :zip, :photo_url
json.average_rating @shop.average_rating
json.num_reviews @shop.number_reviews
json.phone @shop.parse_phone_number
json.nonparsed_phone @shop.phone
json.longitude @shop.longitude
json.latitude @shop.latitude
json.coordinates do
  json.longitude @shop.longitude
  json.latitude @shop.latitude
end

json.photo_url @shop.photo_url

json.reviews do
  json.array! @reviews do |review|
    json.author_id review.author_id
    json.shop_id review.shop_id
    json.body review.body
    json.barber_name review.barber.name
    json.username review.author.username
    json.avatar_url review.author.photo_url
    json.rating review.rating
    json.pictures do
      json.array! review.pictures do |picture|
        json.photo_comment picture.picture_comment
        json.photo_url picture.photo_url
      end
    end
  end
end

json.barbers do
  json.array! @barbers do |barber|
    json.id barber.id
    json.shop_id barber.shop_id
    json.name barber.name
    json.rating barber.average_rating
    json.number_reviews barber.number_reviews
    json.photo_url barber.photo_url
    json.portfolio_pictures do
      json.array! barber.pictures do |picture|
        json.picture_comment picture.picture_comment
        json.barber_id picture.imageable_id
        json.photo_url picture.photo_url
      end
    end
  end
end

json.tag_list @shop.tag_list
json.location_list @shop.location_list
