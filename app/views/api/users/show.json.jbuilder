json.extract! @user, :username, :email, :photo_url
json.shops do
  json.array! @user.shops do |shop|
    json.extract! shop, :name, :photo_url, :id, :moderator_id
    json.num_reviews shop.number_reviews
    json.average_rating shop.average_rating
    json.check shop.barbers.empty?
    json.tag_list shop.tag_list
  end
end
