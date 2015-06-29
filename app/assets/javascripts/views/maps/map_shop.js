MyCut.Views.ShopMap = Backbone.CompositeView.extend({
  attributes: {
    id: "map-canvas",
  },

  events: {
     "click .cancel-button": "closeModal"
   },

  initialize: function(options) {
    this.shop = options.model;
    this.markerImage = "http://res.cloudinary.com/mycut/image/upload/c_scale,w_20/v1435185992/raty/scissor.png";
  },

  // closeModal: function() {
  //   this.$el.hide();
  // },

  initMap: function() {
    var mapOptions = {
      center: { lat: 37.7577, lng: -122.4376 },
      zoom: 4
    };
    this._map = new window.google.maps.Map(this.el, mapOptions);
    // var marker = new google.maps.Marker({
    //   position: { lat: this.shop.get('latitude'), lng: this.shop.get('longitude') },
    //   map: this._map,
    //   icon: this.markerImage
    // });
  }
})
