  MyCut.Routers.Router = Backbone.Router.extend({
  routes: {
    "":                                  "shopSearch",
    "account":                           "accountShow",
    "shops/new":                         "shopForm",
    "shops/search?*parameters":          "shopSearch",
    "shops/:id":                         "shopShow",
    "shops/:id/edit":                    "shopForm",
    "shops/:id/edit/barbers":            "shopBarbersNew",
    "shops/:id/review/new":              "reviewNew",
    "shops/:id/barbers/:bid":            "barberShow"

  },

  initialize: function(options) {
    this.$main = options.$main;
  },

  accountShow: function(){
    var user = new MyCut.Models.User({id: window.id});
    user.fetch();
    var accountView = new MyCut.Views.UserAccount({
      model: user,
      collection: user.shops()
    })
    this._swapView(accountView);

  },

  barberShow: function(id, bid){
    var barber = new MyCut.Collections.Barbers().getOrFetch(bid)
    var barberView = new MyCut.Views.BarberShow({
      model: barber,
      collection: barber.portfolio_pictures()
    });
    this.preSwap(barberView);
  },

  shopBarbersNew: function(id){
    var currentShop = MyCut.shops.getOrFetch(id);
    var barberCreationView = new MyCut.Views.ShopAddBarbers({
      model: currentShop,
      collection: currentShop.barbers()
    });
    this._swapView(barberCreationView);
  },

  reviewNew: function(id) {
    var shopModel = MyCut.shops.getOrFetch(id);
    var newReviewForm = new MyCut.Views.NewReviewForm({
       model: shopModel,
       collection: shopModel.reviews(),
       barbers: shopModel.barbers()
    });
    this.preSwap(newReviewForm);
  },

  shopForm: function(id) {
    if (id) {
      var shop = MyCut.shops.getOrFetch(id)
    } else {
      var shop = new MyCut.Models.Shop();
    }
    var newShopForm = new MyCut.Views.ShopForm({
      model: shop,
      collection: MyCut.shops
    })
    this.preSwap(newShopForm);
  },

  shopSearch:function(params){

    if (params) {
      var query = {}
      params.replace(
        new RegExp("([^?=&]+)(=([^&]*))?", "g"),
        function($0, $1, $2, $3) { query[$1] = $3; }
      )
      var searchResults = new MyCut.Collections.SearchResult()
      searchResults.fetch({ data: { filter_options: query } })
      var landingPage = new MyCut.Views.ShopSearchView({
        newLoc: query.loc,
        collection: searchResults
      })
    } else {
      // MyCut.shops.fetch();
      var landingPage = new MyCut.Views.ShopSearchView({
        newLoc: window.currentLoc,
        collection: MyCut.shops
      })
    }
    this.preSwap(landingPage);
    landingPage.indexMap.initMap(true);
    window.$('.index-banner').show();
    // window.currentLoc = query.loc;

  },

  shopShow: function(id) {
    var shopModel = MyCut.shops.getOrFetch(id);
    var shopView = new MyCut.Views.ShowShop({ model: shopModel});
    this.preSwap(shopView);
  },

  preSwap: function(newView) {
    window.$('.index-banner').hide();
    $('.modal-form') && $('.modal-form').remove();
    this._swapView(newView)
  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$main.html(newView.$el);
    newView.render();
  }


});
