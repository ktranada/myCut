MyCut.Views.ShopAddBarbers = Backbone.CompositeView.extedn({
  template: JST['shops/shop_edit_barbers'],

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render);
    this.addBarberCreationViews();
  },

  render: function(){
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }

});
