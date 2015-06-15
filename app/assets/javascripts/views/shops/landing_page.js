MyCut.Views.LandingPage = Backbone.CompositeView.extend({
  template: JST['shops/landing_page'],
  initialize: function() {
    this.indexMap = new MyCut.Views.IndexMap();
    this.shopsIndex = new MyCut.Views.ShopIndex({ collection: this.collection });
    debugger
  },

  render: function() {
    var renderedLandingPage = this.template();
    this.$el.html(renderedLandingPage);
    this.$('.shops-composite').html(this.shopsIndex.render().$el);
    this.$("#map-canvas").html(this.indexMap.$el);
    return this;
  }

});
