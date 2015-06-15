MyCut.Routers.Router = Backbone.Router.extend({
  routes: {
    "":         "feedLandingPage",
    "shops/new": "createShop",
    "shops":   "searchShow"

  },

  initialize: function(options) {
    this.$main = options.$main;
  },

  createShop: function() {
    var newShop = new MyCut.Views.NewShop({
      collection: MyCut.shops
    })
    this._swapView(newShop);
  },

  feedLandingPage: function() {
    var landingPage = new MyCut.Views.LandingPage({
      collection: MyCut.shops
    })
    this._swapView(landingPage);

    landingPage.indexMap.initMap();
  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    // Insert the view's `$el` before initializing the map object
    // b/c of how GMaps resizes
    this.$main.html(newView.render().$el);

  }


});
