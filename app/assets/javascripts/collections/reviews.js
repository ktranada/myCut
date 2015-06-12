window.MyCut.Collections.Reviews = Backbone.Collection.extend({
  url: '/api/reviews',

  getOrFetch: function(id) {
    var reviews = this;
    var review = reviews.get('id');
    if (review){
      review.fetch();
    } else {
      review = new MyCut.Models.Picture( { id: id } );
      review.fetch({
        success: function() {
          reviews.add(review);
        }
      });
    }
    return review;
  }
});
