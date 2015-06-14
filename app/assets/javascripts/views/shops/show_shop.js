MyCut.Views.ShopItem = Backbone.CompositeView.extend({
  template: JST['shops/show_shop_item'],
  className: "shop-item",

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({ shop: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});
