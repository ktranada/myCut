MyCut.Models.Barber = Backbone.Model.extend({
  urlRoot: '/api/barbers',

  portfolio_pictures: function() {
    this._portfolio_pictures = this._portfolio_pictures ||
      new MyCut.Collections.Pictures([], barber: this)
    return this._portfolio_pictures
  },

  parse: function(response) {
    if (response.pictures) {
      this.portfolio_pictures().set(response.pictures, { parse: true });
      delete response.pictures
    }
    return response
  }

});
