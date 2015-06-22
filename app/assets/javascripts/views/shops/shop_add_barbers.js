MyCut.Views.ShopAddBarbers = Backbone.CompositeView.extedn({
  template: JST['shops/new_barbers'],

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }

});
