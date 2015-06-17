json.extract! @review, :id, :author_id, :shop_id, :rating
json.body @review.body
json.author @author, :username, :photo_url
json.pictures @review.pictures do |picture|
  json.photo_url picture.photo_url
  json.photo_comment picture.picture_comment
end
