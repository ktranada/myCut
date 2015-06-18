json.extract!(@barber, :id, :name, :shop_id, :photo_url)
json.portfolio_pictures @barber.pictures do |picture|
    json.photo_url picture.photo_url
    json.photo_comment picture.picture_comment
end
