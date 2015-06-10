# Phase 2b: Showing a shop, its barbers, and reviews. ~1  day

## Rails
### Models

### Controllers

### Views

## Backbone
### Models

### Collections

### Views

* ShowShop (composite view, contains { <br>
  `ReviewList` (composite view, contains `ReviewListItem` subviews } and <br>
  `BarberList` (composite view, contains `BarberShow` subviews)
* BarberList
  * BarberShow
* ReviewList
  * ReviewListItem
* MapItemView

Is it bad practice to nest composite views? What's a better solution?
