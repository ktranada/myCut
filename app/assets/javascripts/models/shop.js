MyCut.Models.Shop = Backbone.Model.extend({
  urlRoot: '/api/shops',

  reviews: function() {
    this._reviews = this._reviews ||
       new MyCut.Collections.Reviews([], { shop: this });
    return this._reviews;
  },

  barbers: function() {
    this._barbers = this._barbers ||
       new MyCut.Collections.Barbers([], { shop: this });
    return this._barbers;
  },

  getBarberById: function(id) {
    this._barbers.toJSON.each(function(barber){
      if (barber.id === id) {
        return barber;
      }
    })
  },

  parse: function(response) {
    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews
    }

    if (response.barbers) {
      this.barbers().set(response.barbers, {parse: true});
      delete response.barbers
    }
    return response;
  }

});
