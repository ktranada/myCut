MyCut.Views.LandingPage = Backbone.View.extend({

  template: JST['shops/index'],

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.listenTo(this.collection, "add", this.addShopSubview)
    // this.listenTo(this.barbers(), "add", this.addBarberSubview)

    this.collection.each(this.addShopSubview.bind(this));
    // this.barbers().each(this.addBarberSubview.bind(this));

    var googleMapView = new MyCut.Views.MapItem();
    this.addSubview("#map-canvas", googleMapView);
  },

  addShopSubview: function(shop) {
    var shopSubview = new MyCut.Views.ShopItem({ model: shop })
    this.addSubview(".shop-items", shopSubview);
  },


  render: function() {
    var renderedLandingPage = this.template({});
    this.$el.html(renderedLandingPage);
    this.attachSubviews;
    return this;
  }

});
