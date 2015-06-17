json.extract! @review, :id, :author_id, :shop_id, :rating
json.body @review.body
json.author do
  json.username @author.username
  json.author_photo_url @author.photo_url
end
json.pictures @review.pictures do |picture|
  json.photo_url picture.photo_url
  json.photo_comment picture.picture_comment
end
