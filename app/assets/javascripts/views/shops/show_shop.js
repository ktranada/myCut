MyCut.Views.ShopItem = Backbone.CompositeView.extend({
  template: JST['shops/show_shop_item'],
  className: "shop-index-item col-md-6 col-md-offset-1",

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({ shop: this.model });
    this.$el.html(renderedContent);
    this.$el.find('.rating').raty({
      score: this.model.attributes.rating,
      path: 'assets'
      })
    return this;
  }
});
