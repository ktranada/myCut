MyCut.Views.ShopItem = Backbone.CompositeView.extend({
  template: JST['shops/shop_index_item'],
  className: "shop-item col-md-12",
  attributes: function() {
    return {
    "data-listing-id": this.model.get('id')
    }
  },

  initialize: function(options) {
    this.map = options.map;
    this.listenTo(this.model, "sync", this.render);
  },




  render: function() {
    var renderedContent = this.template({
      shop: this.model
      });
    this.$el.html(renderedContent);
    this.$el.find('.rating').raty({
      score: this.model.attributes.average_rating,
      path: 'assets/raty'
      })
    return this;
  }
});
