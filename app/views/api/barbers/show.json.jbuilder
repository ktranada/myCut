json.extract!(@barber, :id, :name, :shop_id, :photo_url)
json.portfolio_pictures @barber.pictures do |picture|
    json.photo_url picture.photo_url
    json.photo_comment picture.picture_comment
end
json.reviews @reviews do |review|
  json.author review.author.username
  json.date review.parsed_create_date
  json.avatar_url review.author.photo_url
  json.rating review.rating
  json.body review.body
end
