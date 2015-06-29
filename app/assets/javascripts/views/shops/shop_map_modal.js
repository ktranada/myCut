MyCut.Views.ShopMapModal = Backbone.CompositeView.extend({
  template: JST['maps/map_modal'],
  className: "modal-form shop-map-modal",

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    this.shopMap = new MyCut.Views.ShopMap({model: this.model});
  },

  render: function(){
    this.$(".map").html(this.shopMap.$el);
    this.shopMap.initMap(true);
    return this;
  }

})
