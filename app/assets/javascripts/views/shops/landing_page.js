MyCut.Views.LandingPage = Backbone.CompositeView.extend({
  template: JST['shops/index'],

  initialize: function() {
    // This will replace the entire .shop-items-index with
    // an empty div
    // this.listenTo(this.collection, "sync", this.render)
    this.listenTo(this.collection, "add", this.addShopSubviews)
    // this.listenTo(this.barbers(), "add", this.addBarberSubview)

    this.collection.each(this.addShopSubviews.bind(this));
    // this.barbers().each(this.addBarberSubview.bind(this));

    this.indexMap = new MyCut.Views.IndexMap();
    this.indexMap.initMap();
  },

  addShopSubviews: function(shop) {
    var shopSubview = new MyCut.Views.ShopItem({ model: shop });
    this.addSubview(".shop-items-index", shopSubview);
  },


  render: function() {
    var renderedLandingPage = this.template();
    this.$el.html(renderedLandingPage);
    this.$("#map-canvas").html(this.indexMap.$el);
    return this;
  }

});
