json.(@shop, :name, :address, :city, :state, :zip)
json.average_rating @shop.average_rating
json.num_reviews @shop.number_reviews
json.phone @shop.parse_phone_number
json.coordinates do
  json.latitude @shop.latitude
  json.longitude @shop.longitude
end
json.photo_url @shop.photo_url

json.reviews do
  json.array! @shop.reviews do |review|
    json.author_id review.author_id
    json.shop_id review.shop_id
    json.body review.body
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
    json.shop_id barber.id
    json.name barber.name
    json.rating barber.rating
    json.photo_url barber.photo_url
    json.portfolio_pictures do
      json.array! barber.pictures do |picture|
        json.picture_comment picture.picture_comment
        json.barber_id picture.imageable_id
      end
    end
  end
end

json.tags @shop.tag_list
json.near_tags @shop.location_list