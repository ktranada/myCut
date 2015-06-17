MyCut.Models.Review = Backbone.Model.extend({
  urlRoot: '/api/reviews',

  pictures: function() {
    this._pictures = this._pictures ||
      new MyCut.Collections.Pictures([], { review: this });
    return this._pictures
  },

  author: function(){
    this._author = {}
    return this._author
  },

  parse: function(response) {
    if (response.pictures) {
      this.pictures().set(response.pictures, { parse: true } )
      delete response.pictures
    }

    if (response.author) {
      this.author().set(response.author, {parse: true})
      delete response.author
    }
    return response;
  }

});
