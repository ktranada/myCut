# MyCut

I like to maintain my appearance and have my hair cut often. Whenever I visit a new city and need a haircut, it's 
always a hit-or-miss type of deal with finding a good barber. I usually assume that Yelp would be a great source. 

However, I noticed that Yelp ratings generally represent the store as a whole (it could be something like  '5 stars for a clean place,' '1 star because it was too busy,' etc) and thus, not accurately representing the skills and services offered at the establishment. Even when the review ratings are directed towards a certain barber, they tend to not have images, so the reader will have to imagine the experience and hope it is what they want.

With 'myCut', I present a new rating system: review ratings are assigned to a certain Barber/Stylist and the 'store rating' is the average of the 'review ratings'. As opposed to having irrelevant photos for a shop (shop front, shop sign, etc), users will be able to view a Barber and their portfolios, as well as user submitted reviews directed towards that barber.

Ideally, I plan to require reviews to have user supplied photos in order to further advocate the idea of 'proof based reasoning'. 

In the Bay Area, a respectable self image is a desirable accomplishment and I believe that my idea will streamline this process.

[Check it out, it's live!][heroku]

[heroku]: http://mycut.space/welcome

## Minimum Viable Product
Users can:

- [x] Create accounts
  - [x] Create sessions (log in)
- [x] Create Shops
- [x] Read/Write shop reviews
- [x] Make queries
  - [x] Find
    - [x] Tags
    - [x] Shop name
    - [x] Location
- [x] View
  - [x] Geolocation using Google Maps API
  - [x] Barbershops/salons
  - [x] Barbers/stylists and their portfolio
- [x] User supplied photos
- [x] Ratings
  - [x] Star rating of barber

## Technologies
### Rails 
  * Basic CRUD RESTful API
  * Complex forms
  * User authentication + validating sessions
  * Database + Model level validations & associations
  * Pagination
  * APIs
    * Google Maps JavaScript API
    * Ruby Geocoder
  * Gems
  * SOON: Sendgrid + delayed_job

### JavaScript/Backbone
  * Bootstrap
  * jQuery
  * AJAX
  * Backbone
    * Consumes my Rails JSON API 
  
---- 

## Design Docs
* [View Wireframes][views]
  * https://cacoo.com/diagrams/1DfWe5hx0FvEvz7p
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication and Validations (~.5 day)
User + session authentication through standard Rails 
practices and a primary static page to host my Backbone application. In addition,
I will hammer out the initial migrations, models, both DB and model level validations,
as well as the necessary associations. Pushin' it to heroku.

[Details][phase-one]

### Phase 2a: Creating Shops and Reviews, displaying Shops Index (~3 days)
I will add API endpoints to serve shop, review, and barber data as JSON,
then add Backbone models and collections that fetch data from those routes. 
I will set up the Backbone views so that users will be able to create
shops, reviews, and be able to see an index of shops side by side with a
google map view.

[Details][phase-two-a]

### Phase 2b: Showing a shop, its barbers, and reviews. (~1.5 days)
Create a `Shop` Composite view comprised of: `Review` and `Barber` subviews.
I will create Backbone routes for writing reviews and for viewing barbers.
The goal is to had modularity beween the components in order to maximize
responsiveness.

[Details][phase-two-b]

### Phase 3: Create barber portfolio view  (~.5 day)
Create a backbone composite view to display a barber's portfolio. 

[Details][phase-three]

### Phase 4: Search for shops (~2 days)
I'll need to add `search` routes to the Shops controller. On the
Backbone side, there will be a `SearchResults` composite view has `ShopIndex`
and `PostsIndex` subviews. These views will use plain old `shop`
collections, but they will fetch from the new `search` routes.
[Details][phase-five]

### Bonus Features (TBD)
- [x] Enable user creation of tags
- [x] Show on specific reviews for barber on page
- [x] Place safeguards against non-privileged users from accessing the API.
- [x] Allow moderator to upload photo to a portfolio
- [ ] Many-to-many association between barber + shop
- [x] Display shop by average rating 
- [ ] Activity history (e.g. likes, reblogs, taggings)
- [ ] Queries
  - [ ] Search by barber
- [ ] Barber Account
  - [ ] Upload portfolio 
- [x] Modal barber portfolio
[phase-one]: ./docs/phases/phase1.md
[phase-two-a]: ./docs/phases/phase2a.md
[phase-two-b]: ./docs/phases/phase2b.md
[phase-three]: ./docs/phases/phase3.md
[phase-five]: ./docs/phases/phase5.md

