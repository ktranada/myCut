json.extract! @review, :id, :author_id, :shop_id, :rating, :barber_id
json.body @review.body
json.barber_name @review.barber.name
json.author_username @author.username
json.avatar_url @author.photo_url
json.photo_url @author.photo_url
json.pictures @review.pictures do |picture|
  json.photo_url picture.photo_url
  json.photo_comment picture.picture_comment
end
