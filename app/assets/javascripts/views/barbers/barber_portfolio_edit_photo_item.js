MyCut.Views.PortfolioPicture = Backbone.CompositeView.extend({
  template: JST['barbers/barber_portfolio_edit_photo_item'],

  tagName: "li",

  className: "portfolio-collection-item",

  events: {
    "click .delete-picture": "deletePicture"
  },

  initialize: function(options) {
    this.picture = options.picture
  },

  deletePicture: function(event){
    
    this.model.destroy();
  },

  render: function(){
    this.$el.html(this.template({ picture: this.model }));
    return this;
  }
});
