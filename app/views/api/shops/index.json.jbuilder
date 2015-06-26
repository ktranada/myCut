json.array! @shops do |shop|
  json.extract! shop, :id, :name, :address, :city, :state, :zip
  json.average_rating shop.average_rating
  json.num_reviews shop.number_reviews
  json.phone shop.parse_phone_number
  json.photo_url shop.photo_url
  json.latitude shop.latitude
  json.longitude shop.longitude
  json.tag_list shop.tag_list
end
