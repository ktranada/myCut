MyCut.Views.ShopItem = Backbone.CompositeView.extend({
  template: JST['shops/show_shop_item'],
  className: "shop-item col-md-12",

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({ shop: this.model });
    this.$el.html(renderedContent);
    this.$el.find('.rating').raty({
      score: this.model.attributes.average_rating,
      path: 'assets'
      })
    return this;
  }
});
