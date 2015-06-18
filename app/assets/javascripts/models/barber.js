MyCut.Models.Barber = Backbone.Model.extend({
  urlRoot: '/api/barbers',

  portfolio_pictures: function() {
    this._portfolio_pictures = this._portfolio_pictures ||
      new MyCut.Collections.Pictures([], { barber: this } )
    return this._portfolio_pictures
  },

  parse: function(response) {
    debugger
    if (response.portfolio_pictures) {
      this.portfolio_pictures().set(response.portfolio_pictures, { parse: true });
      delete response.portfolio_pictures
    }
    return response
  }

});
