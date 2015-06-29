MyCut.Views.IndexMap = Backbone.View.extend({
  attributes: {
    id: "map-canvas"
  },

  initialize: function(options){
    this._markers = {};
    this.updatedLoc = options.updatedLoc;
    this.markerImage = "http://res.cloudinary.com/mycut/image/upload/c_scale,w_20/v1435185992/raty/scissor.png";

    // this.listenTo(this.collection, 'add', this.addMarker);
    // this.listenTo(this.collection, 'remove', this.removeMarker);
  },

  initMap: function(addMarkers){
    var mapOptions = this.updatedLoc || {
      center: { lat: 37.7577, lng: -122.4376 },
      zoom: 11
    };
    this._map = new window.google.maps.Map(this.el, mapOptions);
    if (addMarkers){
      this.collection.each(this.addMarker.bind(this))
      // this.attachMapListeners();
    }
  },

  // Event handlers
   addMarker: function (listing) {
     if (this._markers[listing.id]) { return };
debugger
     var view = this;
     var marker = new google.maps.Marker({
       position: { lat: listing.get('latitude'), lng: listing.get('longitude') },
       map: this._map,
       icon: this.markerImage
     });

     google.maps.event.addListener(marker, 'click', function (event) {
       view.showMarkerInfo(event, marker, listing);
     });

     this._markers[listing.id] = marker;
   },

   removeMarker: function (listing) {
     var marker = this._markers[listing.id];
     marker.setMap(null);
     delete this._markers[listing.id];
   },

   showMarkerInfo: function (event, marker, shop) {
     // This event will be triggered when a marker is clicked. Right now it
     // simply opens an info window with the title of the marker. However, you
     // could get fancier if you wanted (maybe use a template for the content of
     // the window?)
     var shopInfo = JST['maps/info_window']({ shop: shop });
     var infoWindow = new google.maps.InfoWindow({
       content: shopInfo
     });

     infoWindow.open(this._map, marker);
   },

   changeCenter: function(loc){
     this._map.setCenter(loc);
   },

   startBounce: function (id) {

      var marker = this._markers[id];
      marker.setAnimation(google.maps.Animation.BOUNCE);
    },

    stopBounce: function (id) {
      var marker = this._markers[id];
      marker.setAnimation(null);
    }

});
