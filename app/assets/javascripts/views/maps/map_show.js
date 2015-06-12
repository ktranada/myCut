MyCut.Views.MapItem = Backbone.Views.extend({
  attributes: {
   id: "map-canvas"
  },

  initMap: function(){
    var mapOptions = {
      center: { lat: 37.7833, lng: 122.2591 },
      zoom: 12
    };
    this._map = new google.maps.Map(this.el, mapOptions);
  }

});
