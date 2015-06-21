MyCut.Views.IndexMap = Backbone.View.extend({
  attributes: {
    id: "map-canvas"
  },
  className: "circular col-md-offset-4",

  initialize: function(options){
    this._markers = {};
    this.updatedLoc = options.updatedLoc;
    this.geocoder = new google.maps.Geocoder();

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
     var listingAttributes = listing.attributes;
     var fullAddress = listingAttributes.address +
                       ', ' + listingAttributes.city +
                       ', ' + listingAttributes.state +
                       ', ' + listingAttributes.zip;
     this._coordinates = listing.get('coordinates') ||
      this.geocoder.geocode({address: fullAddress}, function(result, status){
        if (status == google.maps.GeocoderStatus.OK) {
          return result[0].geometry.location;
        } else {
          alert("That location does not exist!");
        }
      })
debugger
     var marker = new google.maps.Marker({
       position: { lat: this._coordinates.latitude, lng: this._coordinates.longitude },
       map: this._map,
       title: listing.get('name')
     });

     google.maps.event.addListener(marker, 'click', function (event) {
       view.showMarkerInfo(event, marker);
     });

     this._markers[listing.id] = marker;
   },

   attachMapListeners: function(){
     this.listenTo(this.collection, "add", this.addMarker);
     this.listenTo(this.colleciton, "remove", this.removeMarker)
   },


   removeMarker: function (listing) {
     var marker = this._markers[listing.id];
     marker.setMap(null);
     delete this._markers[listing.id];
   },

   showMarkerInfo: function (event, marker) {
     // This event will be triggered when a marker is clicked. Right now it
     // simply opens an info window with the title of the marker. However, you
     // could get fancier if you wanted (maybe use a template for the content of
     // the window?)

     var infoWindow = new google.maps.InfoWindow({
       content: marker.title
     });

     infoWindow.open(this._map, marker);
   },

   changeCenter: function(loc){
     debugger
     this._map.setCenter(loc);
   }


});
