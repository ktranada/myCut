MyCut.Views.BarberShow = Backbone.CompositeView.extend({
  template: JST['barbers/barber_show'],

  initialize: function(){
    this.listenTo(this.model, "sync change", this.render);
  },

  render: function(){
    var barberShowView = this.template({
      barber: this.model,
      images: this.collection
    });
    this.$el.html(barberShowView);
    return this;
  }
});
