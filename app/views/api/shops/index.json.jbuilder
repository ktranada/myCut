json.array! @shops do |shop|
  json.extract! shop, :name, :address, :city, :state, :zip
  json.average_rating shop.average_rating
  json.num_reviews shop.number_reviews
  json.phone shop.parse_phone_number
  json.coordinates do
    json.latitude shop.latitude
    json.longitude shop.longitude
  end

end
