MyCut.Models.Review = Backbone.Model.extend({
  urlRoot: '/api/reviews'

  // pictures: function() {
  //   this._pictures = this._pictures ||
  //     new MyCut.Collections.Pictures([], { review: this });
  //   return this._pictures
  // },
  //
  // parse: function(response) {
  //   if (response.pictures) {
  //     this.pictures().set(response.pictures, { parse: true } )
  //     delete response.pictures
  //   }
  //   return response;
  // }

});
