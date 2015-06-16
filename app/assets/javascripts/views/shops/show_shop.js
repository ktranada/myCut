MyCut.Views.ShowShop = Backbone.CompositeView.extend({
  template: JST['shops/show_shop'],

  initialize: function(){
    // var headerSubview = new MyCut.Views.ShopHeader({ shop: this.model })
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    var barbers = this.model.barbers();
    var renderedContent = this.template({
      shop: this.model,
      barbers: barbers
    });

    this.$el.html(renderedContent)
    this.attachSubviews();
    return this;
  }
});
