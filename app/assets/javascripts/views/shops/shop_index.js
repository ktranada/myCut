MyCut.Views.LandingPage = Backbone.View.extend({

  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.listenTo(this.shops(), "add", this.addShopSubview)
    // this.listenTo(this.barbers(), "add", this.addBarberSubview)

    this.shops().each(this.addShopSubview.bind(this));
    // this.barbers().each(this.addBarberSubview.bind(this));
  },

  addShopSubview: function(shop) {
    var shopSubview = new MyCut.Views.ShopItem({ model: shop })
    this.addSubview("", shopSubview);
  },


  render: function() {
    var renderedLandingPage = this.template({});
    this.$el.html(renderedLandingPage);
    this.attachSubviews;
    return this;
  }

});
