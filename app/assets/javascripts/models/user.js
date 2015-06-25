MyCut.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  reviews: function(){
    this._reviews = this._reviews ||
      new MyCut.Collections.Reviews([], {author: this})

    return this._reviews;
  },

  shops: function(){
    this._shops = this._shops ||
      new MyCut.Collections.Shops([], { moderator: this })
    return this._shops;
  },

  parse: function(response){
    if (response.reviews){
      this.reviews().set(response.reviews, {parse: true});
      delete response.reviews;
    }

    if (response.shops){
      this.shops().set(response.shops, {parse: true});
      delete response.shops;
    }
    return response
  }


})
