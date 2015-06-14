MyCut.Views.ShopItem = Backbone.CompositeView.extend({
  className: "col-md-4",
  template: JST['shops/show_shop_item'],

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({ shop: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});
