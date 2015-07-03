MyCut.Views.ShopSearchView = Backbone.CompositeView.extend({
  template: JST['shops/shop_search'],
  className: "first-level",

  initialize: function(options) {
    this.newLoc = options.newLoc;
    this.indexMap = new MyCut.Views.IndexMap({
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
    var geocoder = new google.maps.Geocoder();
    if (loc != window.currentLoc) {
      geocoder.geocode({address: loc}, function(result, status){
        if (status == google.maps.GeocoderStatus.OK) {
           var loc = result[0].geometry.location;
           that.indexMap.changeCenter(loc);
        } else {
          alert("That location does not exist!");
        }
      })
    }
  }

});
