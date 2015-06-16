MyCut.Models.Shop = Backbone.Model.extend({
  urlRoot: '/api/shops',

  reviews: function() {
    this._reviews = this._reviews ||
       new MyCut.Collections.Reviews([], { shop: this });
    return this._reviews;
  },

  barbers: function() {
    this._barbers = this._reviews ||
       new MyCut.Collections.Barbers([], { shop: this });
    return this._barbers;
  },

  parse: function(response) {
    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews
    } else if (response.barbers) {
      this.barbers().set(response.barbers, {parse: true});
      delete response.barbers
    }

    return response;
  }

});
