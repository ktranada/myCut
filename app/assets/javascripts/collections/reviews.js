MyCut.Collections.Reviews = Backbone.Collection.extend({
  model: MyCut.Models.Review,
  url: 'api/reviews',

  // If I were to go down the nested resource path
  // function() {
  //   return '/api/' + this.shop.url() + '/previews'
  // }
  // initialize: function(options) { this.shop = options.shop };

  getOrFetch: function(id) {
    var reviews = this;
    var review = reviews.get(id);
    if (review){
      review.fetch();
    } else {
      review = new MyCut.Models.Review( { id: id } );
      review.fetch({
        success: function() {
          reviews.add(review);
        }
      });
    }
    return review;
  }
});
