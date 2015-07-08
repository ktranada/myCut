MyCut.Views.ShopSearchView = Backbone.CompositeView.extend({
  template: JST['shops/shop_search'],
  className: "first-level",

  initialize: function(options) {
    this.newLoc = options.newLoc;
    this.indexMap = new MyCut.Views.IndexMap({
      updatedLoc: this.newLoc,
      collection: this.collection
    });
    this.shopsIndex = new MyCut.Views.ShopIndex({
      map: this.indexMap,
      collection: this.collection
    });

    this.listenTo(this.collection, "sync", this.render);

  },


  render: function() {
    var renderedLandingPage = this.template();
    this.$el.html(renderedLandingPage);
    this.$('.shops-composite').html(this.shopsIndex.render().$el);
    this.$(".map").html(this.indexMap.$el);
    this.updateLoc(this.newLoc);
    return this;
  },

  updateLoc: function(loc){
    var that = this;
    var geocoder = L.mapbox.geocoder('mapbox.places-v1');
    if (loc != window.currentLoc) {
      geocoder.query(loc, function (err, data){
        if (data.lbounds){
          var newLoc = data.latlng;
          that.indexMap.changeCenter(newLoc);
        }
      })
    }

  }

});
