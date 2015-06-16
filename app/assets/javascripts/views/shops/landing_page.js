MyCut.Views.LandingPage = Backbone.CompositeView.extend({
  template: JST['shops/landing_page'],
  className: "first-level",
  initialize: function() {
    this.indexMap = new MyCut.Views.IndexMap({
      collection: this.collection
    });
    this.shopsIndex = new MyCut.Views.ShopIndex({ collection: this.collection });
  },

  render: function() {
    var renderedLandingPage = this.template();
    this.$el.html(renderedLandingPage);
    this.$('.shops-composite').html(this.shopsIndex.render().$el);
    this.$(".map").html(this.indexMap.$el);
    this.indexMap.initMap();
    return this;
  }

});
