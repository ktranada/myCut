MyCut.Views.IndexMap = Backbone.View.extend({
  attributes: {
    id: "map-canvas"
  },
  className: "circular col-md-offset-4",

  initialize: function(){
    this._markers = {};
    this.geocoder = new google.maps.Geocoder();
    this.listenTo(this.collection, "add", this.addMarker);
    this.listenTo(this.colleciton, "remove", this.removeMarker)
  },

  initMap: function(){
    var mapOptions = {
      center: { lat: 37.7577, lng: -122.4376 },
      zoom: 11
    };
    this._map = new window.google.maps.Map(this.el, mapOptions);
    this.collection.each(this.addMarker.bind(this));
  },

  // Event handlers
   addMarker: function (listing) {
     if (this._markers[listing.id]) { return };
     var view = this;
     var fullAddress = listing.address +
                       ', ' + listing.city +
                       ', ' + listing.state +
                       ', ' + listing.zip;
     this._coordinates = listing.get('coordinates') ||
      this.geocoder({address: fullAddress}, function(result, status){
        if (status == google.maps.GeocoderStatus.OK) {
          return results[0].geometry.location;
        } else {
          alert("That location does not exist!");
        }
      })

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
   }


});
