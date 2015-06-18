MyCut.Routers.Router = Backbone.Router.extend({
  routes: {
    "":                      "feedLandingPage",
    "shops/new":             "createShop",
    "shops/:id":             "showShop",
    "shops/:id/review/new":  "newReview",
    "shops/:id/barbers/:bid":  "barberShow",
    "shops/":                "feedLandingPage"
  },

  initialize: function(options) {
    this.$main = options.$main;
  },

  barberShow: function(id, bid){
    var barbers = new MyCut.Collections.Barbers();
    var barber = barbers.getOrFetch(bid);
    debugger
    var barberView = new MyCut.Views.BarberShow({
      model: barber,
      collection: barber.portfolio_pictures()
    });
    this._swapView(barberView);
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

  newReview: function(id) {
    var shopModel = MyCut.shops.getOrFetch(id);
    var newReviewForm = new MyCut.Views.NewReviewForm({
       model: shopModel,
       collection: shopModel.reviews(),
       barbers: shopModel.barbers()
    });
    this._swapView(newReviewForm);
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
