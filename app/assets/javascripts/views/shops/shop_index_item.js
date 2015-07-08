MyCut.Views.ShopItem = Backbone.CompositeView.extend({
  template: JST['shops/shop_index_item'],
  className: "shop-item col-md-12",

  events: {
    'mouseenter': 'displayTooltip',
    // "mousetenter": "toggleShop"
    'mouseleave': 'hideTooltip'
  },

  initialize: function(options) {
    this.map = options.map;
    this.listenTo(this.model, "sync change", this.render);
    if (this.model.get('tag_list')) {
      this.tagList = this.model.get('tag_list').join(" - ");
    }
  },

  displayTooltip: function () {

    this.map._markers[this.model.get('id')].openPopup();
  },

  hideTooltip: function () {
    this.map._markers[this.model.get('id')].closePopup();
  },

  render: function() {
    
    var renderedContent = this.template({
      shop: this.model,
      tag_list: this.tagList
      });
    this.$el.html(renderedContent);
    this.$el.find('.rating').raty({
      score: this.model.attributes.average_rating,
      path: 'assets/raty'
      })
    return this;
  }
});
