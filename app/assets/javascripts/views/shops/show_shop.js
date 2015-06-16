MyCut.Views.ShowShop = Backbone.CompositeView.extend({
  template: JST['shop/show_shop'],

  initialize: function(){
    // var headerSubview = new MyCut.Views.ShopHeader({ shop: this.model })

  },

  render: function(){
    var renderedContent = this.template();
    this.$el.html(renderedContent)
    this.attachSubviews();
    return this;
  }
});
