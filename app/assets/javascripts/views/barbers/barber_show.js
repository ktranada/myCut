MyCut.Views.ShopBarberView = Backbone.CompositeView.extend({
  template: JST['barbers/barber_profile'],
  tagName: "li",
  events: {
    "click": "displayPortfolio"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  // displayPortfolio: function(){
  //   v
  //
  // }

  render: function(){
    var renderedContent = this.template({
      barber: this.model
    })
    this.$el.html(renderedContent)
    return this;
  }


});
