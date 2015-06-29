MyCut.Models.Barber = Backbone.Model.extend({
  urlRoot: '/api/barbers',

  portfolio_pictures: function() {
    this._portfolio_pictures = this._portfolio_pictures ||
      new MyCut.Collections.Pictures([], { barber: this } )
    return this._portfolio_pictures
  },

  reviews: function(){
    this._reviews = this._reviews ||
      new MyCut.Collections.Reviews([], { barber: this })
  return this._reviews;
  },

  parse: function(response) {
    if (response.portfolio_pictures) {
      this.portfolio_pictures().set(response.portfolio_pictures, { parse: true });
      delete response.portfolio_pictures
    }
    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews
    }

    return response
  }

});
