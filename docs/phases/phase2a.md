# Phase 2a: [Landing Page] Viewing Shop Index + Google Maps API

## Rails
### Models

### Controllers
* API::ShopsController (create, destroy, index, show)
* API::ReviewsController (create, show, destroy, update)
* API::BarbersController (create, index, update)
* API::PhotosController (create, index, show)
* API::TagsController(create, index, show)
* TaggingsController (create, update, destroy)

### Views
* shops/show.json.builder
* tags/index.json.jbuilder

Do I need to create a `photos/show.json.jbuilder` to send photo data in order for `reviews` and `barbers` to be able to access them?

## Backbone
### Models
* Shop (parses nested `reviews` and `barbers` association)
* Review (parse nested `photos` association)
* Barber (parses nested `photos` association)
* Photo

### Collections
* Shops
* Reviews
* Barbers
* Photos

### Views
* SearchShow (composite view, contains ShowIndex (composite view, contains ShopItem subviews) subviews<br> and a singular mapItem view. 
  * ShowIndex view
  * ShopItem view
  * MapItem view
* newReview
* mewShopForm

Is it bad practice to nest composite views?


## Gems/Libraries
* GoogleMap API
* FineUploaded
* PaperClip
