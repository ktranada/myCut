# MyCut

[Heroku link][heroku]

[heroku]: http://mycut.herokuapp.com/

## Minimum Viable Product
myCut is a clone of Yelp built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
  - [x] Create sessions (log in)
- [ ] Create Store
- [ ] Read/Write shop reviews
- [x] Queries
  - [x] Find
    - [x] Tags
    - [x] Shop name
    - [x] Location
- [ ] View
  - [ ] Geolocation using Google Maps API
  - [ ] Barbershops/salons
  - [ ] Barbers/stylists and their portfolio
- [ ] User supplied photos
- [ ] Ratings
  - [ ] Star rating of shop
  - [ ] Star rating of barber


## Design Docs
* [View Wireframes][views]
  * https://cacoo.com/diagrams/1DfWe5hx0FvEvz7p
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication and Validations (~.5 day)
I will implement user authentication + sessions through standard Rails 
practices and a primary static page to host my Backbone application. I well 
set up the the initial migrations, models, both DB and model level validations,
as well as the necessary associations. At this point I will deploy to Heroku.

**Primary duties**: Authentication, validating models + associations, deploying to Heroku.

[Details][phase-one]

### Phase 2a: Creating Shops and Reviews, displaying Shops Index (~3 days)
I will add API endpoints to serve shop, review, and barber data as JSON,
then add Backbone models and collections that fetch data from those routes. 
I will set up the Backbone views so that users will be able to create
shops, reviews, and be able to see an index of shops side by side with a
google map view.

[Details][phase-two-a]

### Phase 2b: Showing a shop, its barbers, and reviews. (~1.5 days)
I will create a Backbone view, `ShopShow`, to display a shop's: description ->
`MapItem` view + `BarberList` (composite view, contains `BarberShow` subviews);
reviews.

[Details][phase-two-b]

### Phase 3: Create barber portfolio view  (~1dayy)
Create a backbone composite view to display a barber's portfolio.

[Details][phase-three]

### Phase 4: Search for shops (~2 days)
I'll need to add `search` routes to the Shops controller. On the
Backbone side, there will be a `SearchResults` composite view has `ShopIndex`
and `PostsIndex` subviews. These views will use plain old `shop`
collections, but they will fetch from the new `search` routes.
[Details][phase-five]

### Bonus Features (TBD)
- [ ] Place safeguards against non-privileged users from accessing the API.
- [ ] Allow moderator to upload photo to a portfolio
- [ ] Many-to-many association between barber + shop
- [ ] Display shop by average rating 
- [ ] Activity history (e.g. likes, reblogs, taggings)
- [ ] Queries
  - [ ] Search by barber
- [ ] Barber Account
  - [ ] Upload portfolio 
- [ ] Read/leave views
  - [ ] Barber/stylist
- [ ] Modal barber portfolio
[phase-one]: ./docs/phases/phase1.md
[phase-two-a]: ./docs/phases/phase2a.md
[phase-two-b]: ./docs/phases/phase2b.md
[phase-three]: ./docs/phases/phase3.md
[phase-five]: ./docs/phases/phase5.md

