MyCut.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  reviews: function(){
    this._reviews = this._reviews ||
      new MyCut.Collections.Reviews([], {author: this})

    return this._reviews;
  },

  parse: function(response){
    if (response.reviews){
      this.reviews().set(response.reviews, {parse: true});
      delete response.reviews;
    }
    return response
  }


})
