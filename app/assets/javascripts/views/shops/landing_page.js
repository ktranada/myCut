MyCut.Views.LandingPage = Backbone.CompositeView.extend({
  template: JST['shops/landing_page'],
  className: "first-level",
  initialize: function(options) {
    this.indexMap = new MyCut.Views.IndexMap({
      collection: this.collection
    });
    this.shopsIndex = new MyCut.Views.ShopIndex({
      collection: this.collection
    });
    this.indexMap.initMap(true);
  },

  render: function() {
    var renderedLandingPage = this.template();
    this.$el.html(renderedLandingPage);
    this.$('.shops-composite').html(this.shopsIndex.render().$el);
    this.$(".map").html(this.indexMap.$el);

    return this;
  }

});
