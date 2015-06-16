MyCut.Routers.Router = Backbone.Router.extend({
  routes: {
    "":           "feedLandingPage",
    "shops/new":  "createShop",
    "shops":      "feedLandingPage",
    "shops/:id":  "showShop"

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
  },

  showShop: function(id) {
    var shopModel = MyCut.shops.getOrFetch(id);
    var shopView = new MyCut.Views.ShowShop({ model: shopModel});
    this._swapView(shopView);
  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;

    this.$main.html(newView.$el);
    newView.render();
  }


});
