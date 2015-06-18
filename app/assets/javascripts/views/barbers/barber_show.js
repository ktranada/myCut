MyCut.Views.BarberShow = Backbone.CompositeView.extend({
  render: function(){
    var barberShowView = this.template({ barber: this.model });
    this.$el.html(barberShowView);
    return this;
  }
});
