MyCut.Views.ShopIndex = Backbone.CompositeView.extend({
  template: JST['shops/shop_index'],

  events: {
    'mouseenter .shop-item': 'startBounce',
    'mouseleave .shop-item': 'stopBounce'
  },

  initialize: function(options) {
    this.map = options.map;
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addShopSubviews)
    this.listenTo(this.collection, "remove", this.removeShopSubviews)
    this.collection.each(this.addShopSubviews.bind(this));
  },

  addShopSubviews: function(shop) {
    debugger
    var shopSubview = new MyCut.Views.ShopItem({
      map: this.map,
      model: shop
    });
    this.addSubview(".shops-index", shopSubview);
  },


  startBounce: function (event) {
    var listingId = $(event.currentTarget).data('listing-id');
    this.map.startBounce(listingId);
  },

  stopBounce: function (event) {
    var listingId = $(event.currentTarget).data('listing-id');
    this.map.stopBounce(listingId);
  },

  removeShopSubviews: function(shop){
    this.removeModelSubview(".shops-index", shop);
  },

  render: function(){
    var renderedContent = this.template()
    this.$el.html(renderedContent)
    this.attachSubviews();
    return this;
  }

});
